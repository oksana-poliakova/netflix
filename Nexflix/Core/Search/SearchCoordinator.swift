//
//  SearchCoordinator.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 17.01.2023.
//

import UIKit

final class SearchCoordinator: Coordinator {
    
    // MARK: - Enum
    
    enum Path {
        case next
    }
    
    // MARK: - Properties
    
    private var navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Functions
    
    func navigate(to step: Path) {
        
    }
}
