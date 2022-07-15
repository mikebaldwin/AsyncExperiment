//
//  Post.swift
//  AsyncExperiment
//
//  Created by Mike Baldwin on 7/15/22.
//

import Foundation

struct Post: Decodable {
    let userID: Int
    let id: Int
    let title: String
    let body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id = "id"
        case title = "title"
        case body = "body"
    }
}
