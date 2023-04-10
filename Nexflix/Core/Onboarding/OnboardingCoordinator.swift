//
//  OnboardingCoordinator.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 12.01.2023.
//

import UIKit

final class OnboardingCoordinator: Coordinator {
    
    // MARK: - Enum

    enum Path {
        case privacy
        case signIn
        case start
    }
    
    // MARK: - Properties
    
    let navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Functions
    
    func navigate(to step: Path) {
        switch step {
        case .start:
//            let coordinator = SignInCoordinator(navigationController: navigationController)
//            let vc = SignInViewController(coordinator: coordinator)
            let manager = SearchManager(query: "stranger")
            let coordinator = DetailCoordinator(navigationController: navigationController)
            let vc = DetailViewController(coordinator: coordinator)
            navigationController.pushViewController(vc, animated: true)
        case .privacy:
            let vc = PrivacyViewController()
            navigationController.pushViewController(vc, animated: true)
        case .signIn:
            let coordinator = SignInCoordinator(navigationController: navigationController)
            let vc = SignInViewController(coordinator: coordinator)
            navigationController.pushViewController(vc, animated: true)
        }
    }
}
