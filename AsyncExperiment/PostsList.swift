//
//  ContentView.swift
//  AsyncExperiment
//
//  Created by Mike Baldwin on 7/15/22.
//

import SwiftUI

struct PostsList: View {
    @ObservedObject var viewModel = PostListViewModel(jsonPlaceholderAPI: JsonPlaceholderAPI())
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.posts) { post in
                    Text(post.title)
                }
            }
            .navigationTitle("Posts")
        }
        .task {
            try? await viewModel.getPosts()
        }
    }
}

struct PostsList_Previews: PreviewProvider {
    static var previews: some View {
        PostsList()
    }
}
