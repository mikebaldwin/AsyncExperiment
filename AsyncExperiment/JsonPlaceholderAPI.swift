//
//  JsonPlaceholderAPI.swift
//  AsyncExperiment
//
//  Created by Mike Baldwin on 7/15/22.
//

import Foundation
import Combine

class JsonPlaceholderAPI {
    private let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    private var cancellables: Set<AnyCancellable> = []

    func getPosts() async throws -> [Post] {
        try await withCheckedThrowingContinuation { continuation in
            getPosts { result in
                switch result {
                case .success(let posts):
                    continuation.resume(returning: posts)
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
    
    private func getPosts(completion: @escaping (Result<[Post], Error>) -> Void) {
        let request = URLRequest(url: url)
        URLSession.shared.dataTaskPublisher(for: request)
            .mapError { $0 }
            .map { $0.data }
            .decode(type: [Post].self, decoder: JSONDecoder())
            .sink(receiveCompletion: { completion in
                print("Completion")
            }, receiveValue: { posts in
                completion(.success(posts))
            })
            .store(in: &cancellables)
    }

}
