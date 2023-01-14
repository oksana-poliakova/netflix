//
//  OnboardingViewController.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 12.01.2023.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    // MARK: - Properties
    
    private let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.tintColor = AppColors.primaryRed
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var privacyButton: BaseTextButton = {
        let button = BaseTextButton()
        button.setTextLabel(text: "Privacy")
        button.addTarget(self, action: #selector(tappedPrivacyButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var signInButton: BaseTextButton = {
        let button = BaseTextButton()
        button.titleLabel?.font = AppFonts.boldRegularButton.font
        button.setTextLabel(text: "Sign In")
        button.addTarget(self, action: #selector(tappedSignInButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [privacyButton, signInButton], axis: .horizontal, spacing: 16, distribution: .fill, aligment: .fill)
        return stackView
    }()
    
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
    
    // MARK: - Init
    
    init() {
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
        
        view.backgroundColor = AppColors.black
        
        // Appearance
        [logoImageView, buttonStackView, onboardingScreenView, getStartedButton].forEach {
            view.addSubView($0, translatesAutoresizingMaskIntiConstraints: false)
        }
        
        // Constraints
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .padding),
            logoImageView.widthAnchor.constraint(equalToConstant: 86),
            logoImageView.heightAnchor.constraint(equalToConstant: CGFloat.icon.small),
            
            buttonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 6),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.padding),
            
            onboardingScreenView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 60),
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
        guard let navigationController = navigationController else { return }
        OnboardingCoordinator(navigationController: navigationController).pressedPrivacyButton()
    }

    @objc func tappedSignInButton() {
        guard let navigationController = navigationController else { return }
        OnboardingCoordinator(navigationController: navigationController).pressedSignInButton()
    }
    
    @objc func tappedGetStartedButton() {
        guard let navigationController = navigationController else { return }
        OnboardingCoordinator(navigationController: navigationController).pressedGetStartedButton()
    }
}
