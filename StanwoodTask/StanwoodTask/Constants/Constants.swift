//
//  Constants.swift
//  GithubTrendingRepositories
//
//  Created by Ian Houghton on 28/06/2018.
//  Copyright © 2018 YakApps. All rights reserved.
//

import Foundation

enum GitHubRequestDuration: Int {
    case yesterday
    case lastWeek
    case lastMonth
}

let GitHubUrlPrefix = "https://api.github.com/search/repositories?q=created%3A"
let GitHubUrlSuffix = "&sort=stars&order=desc&page="
let FavouritesKey = "FavouriteRepos"
let StandardDateFormat = "yyyy-MM-dd"
let FormattedDateFormat = "dd/MM/yyyy"
let FullDateFormat = "yyyy-MM-dd'T'HH:mm:ssZyyyy-MM-dd'T'HH:mm:ssZ"
