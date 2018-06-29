//
//  GetGitHubRepoRequest.swift
//  GithubTrendingRepositories
//
//  Created by Ian Houghton on 28/06/2018.
//  Copyright © 2018 YakApps. All rights reserved.
//

import UIKit

struct GetGitHubRepoRequest {
    
    func getRequest(duration: GitHubRequestDuration, pageNumber: Int, completion: @escaping (_ repos: [GitHubRepo]?) -> Void) {
    
        guard let gitUrl = URL(string: "https://api.github.com/search/repositories?q=created%3A" + "2018-10-06" + "&sort=stars&order=desc&page=" + String(pageNumber)) else {
            return
        }
        
        URLSession.shared.dataTask(with: gitUrl) { (data, response, error) in
            guard let data = data else {
                return
                
            }
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(GitHubRepoList.self, from: data)
                
                completion(gitData.repos)
                
            } catch {
                completion(nil)
            }
        }.resume()
    }
}
