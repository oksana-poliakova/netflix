//
//  SignInCoordinator.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 14.01.2023.
//

import UIKit

final class SignInCoordinator: Coordinator {
    
    // MARK: - Properties
    
    var navigationController: UINavigationController
    
    // MARK: - Init
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    // MARK: - Functions
    
    func start() { }
    
    func signInPressed() {
        let vc = UIViewController()
        navigationController.pushViewController(vc, animated: true)
    }
    
    func recoverPasswordPressed() {
        let vc = UIViewController()
        navigationController.pushViewController(vc, animated: true)
    }
}
