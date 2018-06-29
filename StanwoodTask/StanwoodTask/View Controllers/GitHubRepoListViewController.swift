//
//  ViewController.swift
//  GithubTrendingRepositories
//
//  Created by Ian Houghton on 29/06/2018.
//  Copyright © 2018 YakApps. All rights reserved.
//

import UIKit

class GitHubRepoListViewController: UIViewController {
    
    // MARK: Constants
    static let DetailSegueIdentifier = "ListToDetailSegue"
    
    // MARK: IBOutlets
    @IBOutlet var collectionView:   UICollectionView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    // MARK: Properties
    var viewModel: GitHubRepoListViewModelProtocol = GitHubRepoListViewModel()
    var selectedRepo: GitHubRepo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = self.segmentedControl
        
        self.viewModel.delegate = self
        
        self.collectionView?.delegate = self.viewModel.collectionViewDelegate
        self.collectionView?.dataSource = self.viewModel.collectionViewDatasource
        
        self.viewModel.segmentedControllerDidChange(selectedIndex: self.segmentedControl.selectedSegmentIndex)
    }
    
    // MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == GitHubRepoListViewController.DetailSegueIdentifier {
            guard let detailController = segue.destination as? GitHubRepoDetailViewController, let repo = self.selectedRepo else {
                return
            }
            
            detailController.configure(repo: repo)
        }
    }
    
    // MARK: IBActions
    @IBAction private func segmentedControlDidChange(sender: UISegmentedControl){
        self.viewModel.segmentedControllerDidChange(selectedIndex: self.segmentedControl.selectedSegmentIndex)
        self.collectionView.reloadData()
    }
}

extension GitHubRepoListViewController: GitHubRepoListViewModelDelegate {
    func didUpdateDataSource() {
        DispatchQueue.main.async{
            self.collectionView.reloadData()
        }
    }
    
    func shouldShowRepo(githubrepo: GitHubRepo) {
        self.selectedRepo = githubrepo
        self.performSegue(withIdentifier: GitHubRepoListViewController.DetailSegueIdentifier, sender: nil)
    }
}

