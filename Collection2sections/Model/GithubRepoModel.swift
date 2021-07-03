import Foundation

// MARK: - GitHubRepo
struct GithubRepoModel: Codable {
    let id: Int
    let nodeID, name, fullName: String
    let gitHubRepoPrivate: Bool
    let owner: Owner

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case gitHubRepoPrivate = "private"
        case owner
    }
}

// MARK: - Owner
struct Owner: Codable {
    let login: String
}

typealias GitHubRepos = [GithubRepoModel]
