//
//  GitHubRepository.swift
//  GitFlowers
//
//  Created by 三ツ井渚 on 2025/06/04.
//

struct GitHubUserRepository {
    // GitHubユーザ情報取得
    func fetchUser(username: String) async throws -> GitHubUser {
        return try await GitHubAPIService.shared.fetchUser(username: username)
    }
}

