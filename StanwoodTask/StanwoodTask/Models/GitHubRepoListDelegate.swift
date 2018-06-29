//
//  GitHubRepoListDelegate.swift
//  GithubTrendingRepositories
//
//  Created by Ian Houghton on 28/06/2018.
//  Copyright © 2018 YakApps. All rights reserved.
//

import UIKit

protocol GitHubRepoListDelegateProtocol: UICollectionViewDelegate {
    var repos: [GitHubRepo]? { get set }
    var willDisplayCellHandler: (() -> Void)? { get set }
    var didSelectItemHandler: ((_ selectedRepo: GitHubRepo) -> Void)? { get set }
}

class GitHubRepoListDelegate: NSObject, GitHubRepoListDelegateProtocol {
    
    // MARK: Properties
    var repos: [GitHubRepo]?
    var willDisplayCellHandler: (() -> Void)?
    var didSelectItemHandler: ((_ selectedRepo: GitHubRepo) -> Void)?
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let repo = self.repos![indexPath.row]
        
        guard let handler = self.didSelectItemHandler else {
            return
        }
        handler(repo)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == ((self.repos?.count)! - 2) {
            
            guard let handler = self.willDisplayCellHandler else {
                return
            }
            handler()
        }
    }
}
