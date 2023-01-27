//
//  SignInCoordinator.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 14.01.2023.
//

import UIKit

final class SignInCoordinator: Coordinator {
    
    // MARK: - Enum
    
    enum Path {
        case signIn
        case recoverPassword
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
        case .signIn:
            let coordinator = SearchCoordinator(navigationController: navigationController)
            let searchManager = SearchManager(query: "stranger")
            let vc = SearchViewController(coordinator: coordinator, manager: searchManager)
            navigationController.pushViewController(vc, animated: true)
        case .recoverPassword:
            let vc = UIViewController()
            navigationController.pushViewController(vc, animated: true)
        }
    }
}

