//
//  OnboardingViewController.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 12.01.2023.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    // MARK: - Properties
    
    private let logoImageView = UIImageView()
    private let logoImageItem = UIBarButtonItem(image: UIImage(named: "logo"))
    
    private lazy var privacyButton = UIBarButtonItem(title: "Privacy", style: .plain, target: self, action: #selector(tappedPrivacyButton))
    
    private lazy var signInButton = UIBarButtonItem(title: "Sign In", style: .plain, target: self, action: #selector(tappedSignInButton))

    private lazy var getStartedButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = AppColors.primaryRed
        button.tintColor = AppColors.white
        button.makeBorderedButton(cornerRadius: .cornerRadius, backgroundColor: AppColors.primaryRed)
        button.layer.cornerRadius = .cornerRadius
        button.setTitle("Get Started", for: .normal)
        button.addTarget(self, action: #selector(tappedGetStartedButton), for: .touchUpInside)
        return button
    }()
    
    private let onboardingScreenView = OnboardingScreenView()
    private var coordinator: OnboardingCoordinator
    
    // MARK: - Init
    
    init(coordinator: OnboardingCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    // MARK: - SetupUI
    
    private func setupUI() {
        
        // Navigation
        navigationItem.leftBarButtonItem = logoImageItem
        navigationItem.leftBarButtonItem?.isEnabled = false
        navigationItem.rightBarButtonItems = [privacyButton, signInButton]
        
        view.backgroundColor = AppColors.black
        
        // Appearance
        [onboardingScreenView, getStartedButton].forEach {
            view.addSubView($0, translatesAutoresizingMaskIntiConstraints: false)
        }
        
        // Constraints
        NSLayoutConstraint.activate([
            onboardingScreenView.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            onboardingScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            onboardingScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            onboardingScreenView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            onboardingScreenView.bottomAnchor.constraint(equalTo: getStartedButton.topAnchor, constant: -16),
            
            getStartedButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -14),
            getStartedButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .padding),
            getStartedButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.padding),
            getStartedButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    // MARK: - Actions
    
    @objc func tappedPrivacyButton() {
        coordinator.navigate(to: .privacy)
    }

    @objc func tappedSignInButton() {
        coordinator.navigate(to: .signIn)
    }
    
    @objc func tappedGetStartedButton() {
        coordinator.navigate(to: .start)
    }
}
