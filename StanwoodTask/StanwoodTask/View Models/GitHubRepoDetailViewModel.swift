//
//  GitHubRepoDetailViewModel.swift
//  GithubTrendingRepositories
//
//  Created by Ian Houghton on 29/06/2018.
//  Copyright © 2018 YakApps. All rights reserved.
//

import Foundation

protocol GitHubRepoDetailViewModelProtocol {
    var titleText: String { get }
    var descriptionText: String { get }
    var languageText: String { get }
    var forksText: String { get }
    var starsText: String { get }
    var createdAtText: String { get }
    var githubUrl: URL? { get }
}

struct GitHubRepoDetailViewModel: GitHubRepoDetailViewModelProtocol {
    
    //MARK: Properties
    private var repo: GitHubRepo
    
    init(repo: GitHubRepo) {
        self.repo = repo
    }
    
    var titleText: String {
        get {
            return self.repo.repoName
        }
    }
    
    var descriptionText: String {
        get {
            guard let description = self.repo.description else {
                return "No description specified"
            }
            
            return description
        }
    }
    
    var languageText: String {
        get {
            guard let language = self.repo.language else {
                return "No language specified"
            }
            
            return language
        }
    }
    
    var forksText: String {
        get {
            return String(self.repo.forks) + " forks"
        }
    }
    
    var starsText: String {
        get {
            return String(self.repo.stars) + " stars"
        }
    }
    
    var createdAtText: String {
        get {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = FullDateFormat
            
            guard let createdDate = dateFormatter.date(from: self.repo.creationDate) else {
                return ""
            }
            dateFormatter.dateFormat = FormattedDateFormat
            
            return "Created on " + dateFormatter.string(from: createdDate)
        }
    }
    
    var githubUrl: URL? {
        get {
            return URL(string: self.repo.githubUrl)
        }
    }
}
