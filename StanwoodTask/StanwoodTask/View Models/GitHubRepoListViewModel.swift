//
//  GitHubRepoListViewModel.swift
//  GithubTrendingRepositories
//
//  Created by Ian Houghton on 98/06/2018.
//  Copyright © 2018 YakApps. All rights reserved.
//

import UIKit

class GitHubRepoListViewModel: NSObject {
    
    // MARK: Properties
    let collectionViewDatasource: GitHubRepoListDataSource = GitHubRepoListDataSource()
    let collectionViewDelegate: GitHubRepoListDelegate = GitHubRepoListDelegate()
    
    var pageNumber: Int = 0
    var currentDuration = GitHubRequestDuration.yesterday
    var datasource = [GitHubRepo]()
}

