//
//  GitHubRepoCollectionViewCell.swift
//  GithubTrendingRepositories
//
//  Created by Ian Houghton on 28/06/2018.
//  Copyright © 2018 YakApps. All rights reserved.
//

import UIKit

class GitHubRepoCollectionViewCell: UICollectionViewCell {
    
    // MARK: IBOutlets
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var favouriteImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var starLabel: UILabel!
    
    // MARK: Constants
    static let cellIdentifier = "GitHubRepoCellIdentifier"
    
    func configure(repo: GitHubRepo) {
        self.avatarImageView.load(url: repo.owner.avatarURL)
        self.favouriteImageView.image = UIImage(named: "Star")
        self.nameLabel.text = repo.owner.username + "/" + repo.repoName
        self.descriptionLabel.text = repo.description
        
        if repo.stars > 1000 {
            self.starLabel.text = String(repo.stars / 1000) + "k"
        }
        else {
            self.starLabel.text = String(repo.stars)
        }
    }
    
    override func prepareForReuse() {
        self.avatarImageView.image = nil
        self.favouriteImageView.image = nil
        self.nameLabel.text = nil
        self.descriptionLabel.text = nil
        self.starLabel.text = nil
    }
}
