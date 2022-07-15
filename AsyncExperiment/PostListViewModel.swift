//
//  PostListViewModel.swift
//  AsyncExperiment
//
//  Created by Mike Baldwin on 7/15/22.
//

import Foundation

class PostListViewModel: ObservableObject {
    @Published
    var posts = [Post]()
    
    private var jsonPlaceholderAPI: JsonPlaceholderAPI
    
    init(jsonPlaceholderAPI: JsonPlaceholderAPI) {
        self.jsonPlaceholderAPI = jsonPlaceholderAPI
    }
    
    func getPosts() async throws {
        posts = try await jsonPlaceholderAPI.getPosts()
    }
}
