//
//  GitHubRepoListDataSource.swift
//  GithubTrendingRepositories
//
//  Created by Ian Houghton on 28/06/2018.
//  Copyright © 2018 YakApps. All rights reserved.
//

import UIKit

protocol GitHubRepoListDataSourceProtocol: UICollectionViewDataSource {
    var repos: [GitHubRepo]? { get set }
    var collectionViewCellDelegate: GitHubRepoCollectionViewCellDelegate? { get set }
    var favouritesManager: FavouritesManagerProtocol? { get set }
}

class GitHubRepoListDataSource: NSObject, GitHubRepoListDataSourceProtocol {
    
    var repos: [GitHubRepo]?
    var collectionViewCellDelegate: GitHubRepoCollectionViewCellDelegate?
    var favouritesManager: FavouritesManagerProtocol?
    
    init(cellDelegate: GitHubRepoCollectionViewCellDelegate, favouritesManager: FavouritesManagerProtocol) {
        super.init()
        
        self.collectionViewCellDelegate = cellDelegate
        self.favouritesManager = favouritesManager
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.repos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GitHubRepoCollectionViewCell.cellIdentifier, for: indexPath) as! GitHubRepoCollectionViewCell
        
        guard let items = repos, let faveManager = self.favouritesManager else {
            return cell
        }
        
        let repo = items[indexPath.row]
        
        cell.configure(repo: repo, isFavourite: faveManager.isFavourite(repo: repo), delegate: self.collectionViewCellDelegate)
        
        return cell
    }
}
