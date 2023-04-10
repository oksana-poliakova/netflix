//
//  DetailScreenCoordinator.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 10.04.2023.
//

import UIKit

final class DetailScreenCoordinator {
    
    // MARK: - Enum
    
    enum Path {
        
    }
    
    // MARK: - Properties
    
    private var navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Functions
    
    func navigate(to step: Path) { }
}
