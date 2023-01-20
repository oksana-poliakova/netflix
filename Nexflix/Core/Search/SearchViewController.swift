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
        searchController.searchBar.searchTextField.backgroundColor = AppColors.greyDark2
        searchController.searchBar.setMagnifyingGlassColorTo(color: AppColors.lightGrey1)
        searchController.searchBar.setPlaceholderTextColorTo(color: AppColors.lightGrey1)
        searchController.searchBar.setClearButtonColorTo(color: AppColors.lightGrey1)
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.searchBar.searchBarStyle = .minimal
        return searchController
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
        return tableView
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
        navigationItem.titleView = searchController.searchBar
        navigationItem.setHidesBackButton(true, animated: true)
        
        view.backgroundColor = AppColors.black
        view.addSubview(tableView)
        
        // Constraints
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        
    }
}

extension SearchViewController: UITableViewDelegate {
    
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
}
