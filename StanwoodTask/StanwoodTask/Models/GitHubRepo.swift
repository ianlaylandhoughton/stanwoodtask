//
//  GitHubRepo.swift
//  GithubTrendingRepositories
//
//  Created by Ian Houghton on 29/06/2018.
//  Copyright © 2018 YakApps. All rights reserved.
//

import Foundation

struct GitHubRepoList: Codable {
    let repos: [GitHubRepo]?
    
    enum CodingKeys: String, CodingKey {
        case repos = "items"
    }
}

struct GitHubRepo: Codable {
    let owner: Owner
    let repoName: String
    let description: String?
    let stars: Int
    let language: String?
    let forks: Int
    let creationDate: String
    let githubUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case owner
        case repoName = "name"
        case description
        case stars = "stargazers_count"
        case language
        case forks
        case creationDate = "created_at"
        case githubUrl = "html_url"
    }
}

struct Owner: Codable {
    let username: String
    let avatarURL: String?
    
    enum CodingKeys: String, CodingKey {
        case username = "login"
        case avatarURL = "avatar_url"
    }
}
