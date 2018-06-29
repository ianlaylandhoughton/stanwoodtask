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
    
    // MARK: Properties
    var viewModel: GitHubRepoDetailViewModelProtocol = GitHubRepoDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = self.viewModel.titleText
        self.descriptionLabel.text = self.viewModel.descriptionText
        self.languageLabel.text = self.viewModel.languageText
        
        if self.viewModel.languageText.count == 0 {
            self.languageImage.isHidden = true
        }
        
        self.forksLabel.text = self.viewModel.forksText
        self.starsLabel.text = self.viewModel.starsText
        self.creationDateLabel.text = self.viewModel.createdAtText
    }
    
    func configure(repo: GitHubRepo){
        self.viewModel.repo = repo
    }
    
    // MARK: IBActions
    @IBAction func didPressShowOnGitHub(sender: UIButton){
        guard let unwrappedGithubUrl = self.viewModel.githubUrl else {
            return
        }
        
        self.activityIndicator.startAnimating()
        self.webView.load(URLRequest(url: unwrappedGithubUrl))
        self.fullScreenWebView.isHidden = false
    }
    
    @IBAction func closeButtonPressed(sender: UIButton){
        self.fullScreenWebView.isHidden = true
    }
}

// MARK: WKNavigationDelegate
extension GitHubRepoDetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.activityIndicator.stopAnimating()
    }
}
