//
//  OnboardingCoordinator.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 12.01.2023.
//

import UIKit

final class OnboardingCoordinator: Coordinator {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    func pressedPrivacyButton() {
        let vc = PrivacyViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func pressedSignInButton() {
        let vc = SignInViewController()
        navigationController.pushViewController(vc, animated: true)
    }
}
