//
//  NetworkService.swift
//  Anime
//
//  Created by erick on 12/08/24.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func genericApiCall<T: Codable>(url: String, httpMethod: HttpMethod) -> Future<T?, Error>
}

class NetworkService: NetworkServiceProtocol {
    func genericApiCall<T: Codable>(url: String, httpMethod: HttpMethod) -> Future<T?, Error> {
        return Future { promise in
            Task {
                do {
                    guard let url = URL(string: url) else {
                        throw NetworkError.badUrl
                    }
                    var request = URLRequest(url: url)
                    request.httpMethod = httpMethod.rawValue
                    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
                    let (data, response) = try await URLSession.shared.data(for: request)
                    guard let httpResponse = response as? HTTPURLResponse else {
                        throw NetworkError.badResponse
                    }
                    guard httpResponse.statusCode >= 200 && httpResponse.statusCode < 300 else {
                        throw NetworkError.badStatus
                    }
                    guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
                        throw NetworkError.failedToDecodeResponse
                    }
                    promise(.success(decodedResponse))
                } catch {
                    promise(.failure(error))
                }
            }
        }
    }
}

