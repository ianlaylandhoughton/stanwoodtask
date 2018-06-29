//
//  GitHubRepoListViewModel.swift
//  GithubTrendingRepositories
//
//  Created by Ian Houghton on 28/06/2018.
//  Copyright © 2018 YakApps. All rights reserved.
//

import UIKit

protocol GitHubRepoListViewModelDelegate {
    func didUpdateDataSource()
    func shouldShowRepo(githubrepo: GitHubRepo)
}

protocol GitHubRepoListViewModelProtocol: GitHubRepoCollectionViewCellDelegate  {
    var collectionViewDatasource: GitHubRepoListDataSourceProtocol? { get set }
    var collectionViewDelegate: GitHubRepoListDelegateProtocol? { get set }
    var delegate: GitHubRepoListViewModelDelegate? { get set }
    var favouritesManager: FavouritesManagerProtocol { get set}
    
    func getNextPage()
    func segmentedControllerDidChange(selectedIndex: Int)
}

class GitHubRepoListViewModel: NSObject, GitHubRepoListViewModelProtocol {
    
    // MARK: Properties
    var favouritesManager: FavouritesManagerProtocol = FavouritesManager()
    var collectionViewDatasource: GitHubRepoListDataSourceProtocol?
    var collectionViewDelegate: GitHubRepoListDelegateProtocol? = GitHubRepoListDelegate()
    private var pageNumber: Int = 1
    private var currentDuration = GitHubRequestDuration.yesterday
    private var datasource = [GitHubRepo]()
    
    var delegate: GitHubRepoListViewModelDelegate? {
        didSet {
            self.collectionViewDelegate?.willDisplayCellHandler = {
                self.getNextPage()
            }
            self.collectionViewDelegate?.didSelectItemHandler = { (repo) in
                self.delegate?.shouldShowRepo(githubrepo: repo)
            }
        }
    }
    
    // MARK: Functions
    override init() {
        super.init()
        
        self.collectionViewDatasource = GitHubRepoListDataSource(cellDelegate: self, favouritesManager: self.favouritesManager)
    }
    
    func getNextPage(){
        self.pageNumber = self.pageNumber + 1
        self.performRequest {
            self.delegate?.didUpdateDataSource()
        }
    }
    
    func segmentedControllerDidChange(selectedIndex: Int){
        self.datasource.removeAll()
        self.updateDatasourceAndDelegate(items: self.datasource)
        self.currentDuration = GitHubRequestDuration(rawValue: selectedIndex)!
        self.pageNumber = 1
        self.performRequest {
            self.delegate?.didUpdateDataSource()
        }
    }
    
    private func performRequest(completion: @escaping () -> Void){
        let request = GetGitHubRepoRequest()
        request.getRequest(duration: self.currentDuration, pageNumber: self.pageNumber) { (repos) in
            
            guard let items = repos else {
                self.updateDatasourceAndDelegate(items: nil)
                completion()
                return
            }
            
            self.datasource.append(contentsOf: items)
            self.updateDatasourceAndDelegate(items: self.datasource)
            completion()
        }
    }
    
    private func updateDatasourceAndDelegate(items: [GitHubRepo]?){
        self.collectionViewDatasource?.repos = items
        self.collectionViewDelegate?.repos = items
    }
}

// MARK: GitHubRepoCollectionViewCellDelegate
extension GitHubRepoListViewModel: GitHubRepoCollectionViewCellDelegate {
    func didToggleFavourite(repo: GitHubRepo) {
        self.favouritesManager.isFavourite(repo: repo) ? self.favouritesManager.remove(repo: repo) : self.favouritesManager.save(repo: repo)
        self.delegate?.didUpdateDataSource()
    }
}
