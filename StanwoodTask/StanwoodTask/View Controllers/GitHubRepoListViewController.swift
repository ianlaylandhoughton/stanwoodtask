//
//  ViewController.swift
//  StanwoodTask
//
//  Created by Ian Houghton on 29/06/2018.
//  Copyright © 2018 YakApps. All rights reserved.
//

import UIKit

class GitHubRepoListViewController: UIViewController {

    // MARK: IBOutlets
    @IBOutlet var collectionView:   UICollectionView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    
    // MARK: Properties
    let viewModel = GitHubRepoListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = self.segmentedControl
        
        self.collectionView?.delegate = self.viewModel.collectionViewDelegate
        self.collectionView?.dataSource = self.viewModel.collectionViewDatasource
    }
}

