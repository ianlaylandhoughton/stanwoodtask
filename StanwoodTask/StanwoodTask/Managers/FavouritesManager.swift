//
//  FavouritesManager.swift
//  GithubTrendingRepositories
//
//  Created by Ian Houghton on 29/06/2018.
//  Copyright © 2018 YakApps. All rights reserved.
//

import Foundation

protocol FavouritesManagerProtocol {
    func isFavourite(repo: GitHubRepo) -> Bool
    func save(repo: GitHubRepo)
    func remove(repo: GitHubRepo)
    func getFavouriteRepos() -> [GitHubRepo]
}

struct FavouritesManager: FavouritesManagerProtocol {
    
    // MARK: Functions
    func save(repo: GitHubRepo) {
        var savedRepos = self.getFavouriteRepos()
        savedRepos.append(repo)
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(savedRepos){
            UserDefaults.standard.set(encoded, forKey: FavouritesKey)
        }
    }
    
    func remove(repo: GitHubRepo) {
        var savedRepos = self.getFavouriteRepos()
        
        for index in 0...savedRepos.count {
            if repo.repoName == savedRepos[index].repoName {
                savedRepos.remove(at: index)
                break
            }
        }
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(savedRepos){
            UserDefaults.standard.set(encoded, forKey: FavouritesKey)
        }
    }
    
    func isFavourite(repo: GitHubRepo) -> Bool {
        let savedRepos = self.getFavouriteRepos()
        return savedRepos.contains(where: { $0.repoName == repo.repoName })
    }
    
    func getFavouriteRepos() -> [GitHubRepo] {
        if let favouriteRepos = UserDefaults.standard.value(forKey: FavouritesKey) as? Data{
            let decoder = JSONDecoder()
            if let repos = try? decoder.decode(Array.self, from: favouriteRepos) as [GitHubRepo]{
                return repos
            }
            else {
                return []
            }
        }
        else {
            return []
        }
    }
}
