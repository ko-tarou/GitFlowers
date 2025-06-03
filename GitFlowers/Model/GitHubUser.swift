//
//  GitHubModel.swift
//  GitFlowers
//
//  Created by 三ツ井渚 on 2025/06/04.
//
import Foundation

struct GitHubUser: Identifiable, Codable {
    let id: Int
    let login: String
    let avatarURLString: String
    var avatarURL: URL? { URL(string: avatarURLString) }
    let name: String?
//    let bio: String?
//    let followers: Int
//    let following: Int
//    let publicRepos: Int
//    let htmlURL: String

    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarURLString = "avatar_url"
        case name
//        case bio
//        case followers
//        case following
//        case publicRepos = "public_repos"
//        case htmlURL = "html_url"
    }
}


