//
//  GitHubRepoListDataSource.swift
//  GithubTrendingRepositories
//
//  Created by Ian Houghton on 28/06/2018.
//  Copyright © 2018 YakApps. All rights reserved.
//

import UIKit

class GitHubRepoListDataSource: NSObject, UICollectionViewDataSource {
    
    // MARK: Properties
    var repos: [GitHubRepo]?
    
    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.repos?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GitHubRepoCollectionViewCell.cellIdentifier, for: indexPath) as! GitHubRepoCollectionViewCell
        
        guard let items = repos else {
            return UICollectionViewCell()
        }
        
        cell.configure(repo: items[indexPath.row])
        
        return cell
    }
}
