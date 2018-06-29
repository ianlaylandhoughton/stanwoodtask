//
//  GitHubRepoDetailViewModel.swift
//  GithubTrendingRepositories
//
//  Created by Ian Houghton on 29/06/2018.
//  Copyright © 2018 YakApps. All rights reserved.
//

import Foundation

protocol GitHubRepoDetailViewModelProtocol {
    var repo: GitHubRepo? { get set }
    var titleText: String { get }
    var descriptionText: String { get }
    var languageText: String { get }
    var forksText: String { get }
    var starsText: String { get }
    var createdAtText: String { get }
    var githubUrl: URL? { get }
}

struct GitHubRepoDetailViewModel: GitHubRepoDetailViewModelProtocol {
    
    var repo: GitHubRepo?
    
    var titleText: String {
        get {
            guard let unwrappedRepo = self.repo else {
                return ""
            }
            return unwrappedRepo.repoName
        }
    }
    
    var descriptionText: String {
        get {
            guard let unwrappedRepo = self.repo, let unwrappedDesc = unwrappedRepo.description else {
                return ""
            }
            return unwrappedDesc
        }
    }
    
    var languageText: String {
        get {
            guard let unwrappedRepo = self.repo, let unwrappedLang = unwrappedRepo.language else {
                return ""
            }
            return unwrappedLang
        }
    }
    
    var forksText: String {
        get {
            guard let unwrappedRepo = self.repo else {
                return ""
            }
            return String(unwrappedRepo.forks) + " forks"
        }
    }
    
    var starsText: String {
        get {
            guard let unwrappedRepo = self.repo else {
                return ""
            }
            return String(unwrappedRepo.stars) + " stars"
        }
    }
    
    var createdAtText: String {
        get {
            guard let unwrappedRepo = self.repo else {
                return ""
            }
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            
            guard let createdDate = dateFormatter.date(from: unwrappedRepo.creationDate) else {
                return ""
            }
            dateFormatter.dateFormat = "dd/MM/yyyy"
            
            return "Created on " + dateFormatter.string(from: createdDate)
        }
    }
    
    var githubUrl: URL? {
        get {
            guard let unwrappedRepo = self.repo else {
                return nil
            }
            
            return URL(string: unwrappedRepo.githubUrl)
        }
    }
}
