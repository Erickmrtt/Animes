//
//  TrendingAnimesViewModel.swift
//  Anime
//
//  Created by erick on 14/08/24.
//

import Foundation
import Combine

class TrendingAnimesViewModel {
    var cancellable = Set<AnyCancellable>()
    let networkService: NetworkService!
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    func fetchData() {
        let url = ""

        networkService.genericApiCall(url: url, httpMethod: .get)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Download completed successfully.")
                case .failure(let error):
                    print("Failed to download data: \(error)")
                }
            }, receiveValue: { (data: TrendingAnimesModel?) in
                if let data = data {
                    print("Received data: \(data)")
                } else {
                    print("No data received.")
                }
            })
            .store(in: &cancellable)

    }
}
