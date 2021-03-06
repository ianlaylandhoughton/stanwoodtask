//
//  GitHubFavouritesViewModel.swift
//  StanwoodTask
//
//  Created by Ian Houghton on 29/06/2018.
//  Copyright © 2018 YakApps. All rights reserved.
//

import Foundation

class GitHubFavouritesViewModel: NSObject, GitHubRepoListViewModelProtocol {
    
    // MARK: Properties
    var collectionViewDatasource: GitHubRepoListDataSourceProtocol?
    var collectionViewDelegate: GitHubRepoListDelegateProtocol? = GitHubRepoListDelegate()
    var favouritesManager: FavouritesManagerProtocol = FavouritesManager()
    
    var delegate: GitHubRepoListViewModelDelegate? {
        didSet {
            self.collectionViewDelegate?.didSelectItemHandler = { (repo) in
                self.delegate?.shouldShowRepo(githubrepo: repo)
            }
        }
    }
    
    // MARK: Functions
    override init() {
        super.init()
        
        self.collectionViewDatasource = GitHubRepoListDataSource(cellDelegate: self, favouritesManager: self.favouritesManager)
        
        self.updateDatasourceAndDelegate(items: self.favouritesManager.getFavouriteRepos())
        self.delegate?.didUpdateDataSource()
    }
    
    func getNextPage() {
        // Intentionally left blank
    }
    
    func segmentedControllerDidChange(selectedIndex: Int) {
        // Intentionally left blank
    }
    
    private func updateDatasourceAndDelegate(items: [GitHubRepo]?){
        self.collectionViewDatasource?.repos = items
        self.collectionViewDelegate?.repos = items
    }
}

// MARK: GitHubRepoCollectionViewCellDelegate
extension GitHubFavouritesViewModel: GitHubRepoCollectionViewCellDelegate {
    func didToggleFavourite(repo: GitHubRepo) {
        self.favouritesManager.remove(repo: repo)
        self.updateDatasourceAndDelegate(items: self.favouritesManager.getFavouriteRepos())
        self.delegate?.didUpdateDataSource()
    }
}
