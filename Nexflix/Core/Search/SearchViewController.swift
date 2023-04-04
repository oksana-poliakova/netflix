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
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.register(SearchTableViewCell.self, forCellReuseIdentifier: "SearchTableViewCell")
        return tableView
    }()
    
    private var coordinator: SearchCoordinator
    private let manager: NetworkManager
    private var movieItems: [Title] = []
    
    // MARK: - Init
    
    init(coordinator: SearchCoordinator, manager: NetworkManager) {
        self.coordinator = coordinator
        self.manager = manager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setupUI()
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
    
    private func loadData() {
        manager.fetch { result in
            switch result {
            case .success(let data):
                guard let result = ResultMapper.map(model: Movie.self, data)
                else { return }
                
                self.movieItems = result.titles
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - UITableViewDelegate

extension SearchViewController: UITableViewDelegate {
    
}

// MARK: - UITableViewDataSource

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 40))
        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width - 16, height: headerView.frame.height - 10)
        label.text = "Frequent queries"
        label.font = AppFonts.regularBold.font
        label.textColor = AppColors.white
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell") as? SearchTableViewCell else { return UITableViewCell() }
        cell.configureCell(model: movieItems[indexPath.row])
        return cell
    }
}
