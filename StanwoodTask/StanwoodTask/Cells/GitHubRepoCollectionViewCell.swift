//
//  GitHubRepoCollectionViewCell.swift
//  GithubTrendingRepositories
//
//  Created by Ian Houghton on 28/06/2018.
//  Copyright © 2018 YakApps. All rights reserved.
//

import UIKit

protocol GitHubRepoCollectionViewCellDelegate {
    func didToggleFavourite(repo: GitHubRepo)
}

class GitHubRepoCollectionViewCell: UICollectionViewCell {
    
    // MARK: IBOutlets
    @IBOutlet var avatarImageView: UIImageView!
    @IBOutlet var favouriteButton: UIButton!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var starLabel: UILabel!
    
    // MARK: Constants
    static let cellIdentifier = "GitHubRepoCellIdentifier"
    
    // MARK: Properties
    private var delegate: GitHubRepoCollectionViewCellDelegate?
    private var repo: GitHubRepo?
    
    func configure(repo: GitHubRepo, isFavourite: Bool, delegate: GitHubRepoCollectionViewCellDelegate?) {

        self.repo = repo
        self.delegate = delegate
        
        guard let unwrappedRepo = self.repo else {
            return
        }
        
        self.avatarImageView.load(url: unwrappedRepo.owner.avatarURL)
        self.favouriteButton.setImage(isFavourite ? UIImage(named: "FavouriteStar") : UIImage(named: "Star"), for: UIControlState.normal)
        self.nameLabel.text = unwrappedRepo.owner.username + "/" + unwrappedRepo.repoName
        self.descriptionLabel.text = unwrappedRepo.description
        
        if unwrappedRepo.stars > 1000 {
            self.starLabel.text = String(repo.stars / 1000) + "k"
        }
        else {
            self.starLabel.text = String(repo.stars)
        }
    }
    
    override func prepareForReuse() {
        self.avatarImageView.image = nil
        self.nameLabel.text = nil
        self.descriptionLabel.text = nil
        self.starLabel.text = nil
    }
    
    // MARK: IBActions
    @IBAction func favouriteToggle(sender: UIButton) {
        
        guard let unwrappedRepo = self.repo else {
            return
        }
        self.delegate?.didToggleFavourite(repo: unwrappedRepo)
    }
}
