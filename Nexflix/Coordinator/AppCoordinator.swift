//
//  AppCoordinator.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 12.01.2023.
//

import UIKit


// Composer - responsonsible for compossing all dependencies inside "Any" ViewController
enum OnboardComposer {
    static func compose(navigationController: UINavigationController) -> OnboardingViewController {
        let coordinator = OnboardingCoordinator(navigationController: navigationController)
        return OnboardingViewController(coordinator: coordinator)
    }
}

final class AppCoordinator: Coordinator {
    
    // MARK: - Properties
    
    private var navigationController: UINavigationController
    private let window: UIWindow?
    
    // MARK: - Enum path
    
    enum Path {
        case start
    }
    
    // MARK: - Init
    
    init(navigationController: UINavigationController, window: UIWindow) {
        self.navigationController = navigationController
        self.window = window
    }
    
    func navigate(to step: Path) {
        switch step {
        case .start:
            /// We use navigation controller from scene delegate to send it through navigation stack and compose controller
            navigationController.setViewControllers([OnboardComposer.compose(navigationController: navigationController)], animated: false)
            window?.rootViewController = navigationController
            window?.makeKeyAndVisible()
        }
    }
}

