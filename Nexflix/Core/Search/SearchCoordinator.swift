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
        case next(model: Title)
    }
    
    // MARK: - Properties
    
    private var navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Functions
    
    func navigate(to step: Path) {
        switch step {
        case .next(let model):
            let coordinator = DetailScreenCoordinator(navigationController: navigationController)
            let vc = DetailScreenViewController(coordinator: coordinator, model: model)
            navigationController.pushViewController(vc, animated: true)
        }
    }
}
