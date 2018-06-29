//
//  GitHubRepoDetailViewController.swift
//  GithubTrendingRepositories
//
//  Created by Ian Houghton on 29/06/2018.
//  Copyright © 2018 YakApps. All rights reserved.
//

import UIKit
import WebKit

class GitHubRepoDetailViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var languageImage: UIImageView!
    @IBOutlet var languageLabel: UILabel!
    @IBOutlet var forksLabel: UILabel!
    @IBOutlet var starsLabel: UILabel!
    @IBOutlet var creationDateLabel: UILabel!
    @IBOutlet var webView: WKWebView! {
        didSet {
            self.webView.navigationDelegate = self
        }
    }
    @IBOutlet var fullScreenWebView: UIView!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "title"
    }
    
    func configure(repo: GitHubRepo){
        
    }
}

extension GitHubRepoDetailViewController: WKNavigationDelegate {
}

