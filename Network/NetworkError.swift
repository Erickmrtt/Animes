//
//  NetworkError.swift
//  Anime
//
//  Created by erick on 12/08/24.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}
