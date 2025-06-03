import Foundation

@MainActor
class LoginViewModel: ObservableObject {
    @Published var user: GitHubUser?
    @Published var errorMessage: String?

    private let repository: GitHubUserRepository

    init(repository: GitHubUserRepository = GitHubUserRepository()) {
        self.repository = repository
    }

    func login(username: String) {
        Task {
            do {
                let user = try await repository.fetchUser(username: username)
                self.user = user
                print("ログイン成功: \(user.login)")
            } catch {
                self.errorMessage = "GitHubユーザー取得失敗: \(error.localizedDescription)"
                print(errorMessage!)
            }
        }
    }
}
