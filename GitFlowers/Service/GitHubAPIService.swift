//
//  GitHubAPIService.swift
//  GitFlowers
//
//  Created by 三ツ井渚 on 2025/06/04.
//
import Foundation

struct GitHubAPIService {
    static let shared = GitHubAPIService()
    private init() {}

    func fetchUser(username: String) async throws -> GitHubUser {
        guard let url = URL(string: "https://api.github.com/users/\(username)") else {
            throw URLError(.badURL)
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        let (data, response) = try await URLSession.shared.data(for: request)

        guard let httpResponse = response as? HTTPURLResponse,
              (200..<300).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        let decoder = JSONDecoder()
//        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            return try decoder.decode(GitHubUser.self, from: data)
        } catch {
            print("デコードエラー内容: \(error)")
            print("デコード対象JSON: \(String(data: data, encoding: .utf8) ?? "")")
            throw error
        }


//        return try decoder.decode(GitHubUser.self, from: data)
    }
}
