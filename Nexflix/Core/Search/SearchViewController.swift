//
//  SearchViewController.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 17.01.2023.
//

import UIKit

final class SearchViewController: UIViewController {
    
    // MARK: - Properties
    
    private let searchController: UISearchController = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.searchBarStyle = .minimal
        return searchController
    }()
    
    private var coordinator: SearchCoordinator
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - Init
    
    init(coordinator: SearchCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupUI
    
    private func setupUI() {
        searchController.searchBar.searchTextField.backgroundColor = AppColors.greyDark2
        searchController.searchBar.searchTextField.leftView?.tintColor = AppColors.lightGrey2
        searchController.searchBar.searchTextField.rightView?.tintColor = AppColors.redDark
        navigationItem.titleView = searchController.searchBar
        navigationItem.setHidesBackButton(true, animated: true)
        
        searchController.searchBar.setMagnifyingGlassColorTo(color: AppColors.lightGrey1)
        searchController.searchBar.setPlaceholderTextColorTo(color: AppColors.lightGrey1)
        searchController.searchBar.setClearButtonColorTo(color: AppColors.lightGrey1)
    }
}
