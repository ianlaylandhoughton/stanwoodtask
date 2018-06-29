//
//  UIImageViewExtension.swift
//  GithubTrendingRepositories
//
//  Created by Ian Houghton on 28/06/2018.
//  Copyright © 2018 YakApps. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func load(url: String?) {
        let cache = URLCache.shared
        
        guard let imageString = url, let imageUrl = URL(string: imageString) else {
            self.image = UIImage(named: "PlaceholderImage")
            return
        }
        
        let request = URLRequest(url: imageUrl)
        
        if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
            self.image = image
        } else {
            self.image = UIImage(named: "PlaceholderImage")
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                if let data = data, let response = response, let image = UIImage(data: data) {
                    let cachedData = CachedURLResponse(response: response, data: data)
                    cache.storeCachedResponse(cachedData, for: request)
                    self.image = image
                }
            }).resume()
        }
    }
}
