//
//  OnboardingViewController.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 12.01.2023.
//

import UIKit

final class OnboardingViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.tintColor = AppColors.primaryRed
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var privacyButton: BaseTextButton = {
        let button = BaseTextButton(type: .light(fontSize: 16))
        button.setTextLabel(text: "Privacy")
        return button
    }()
    
    private lazy var signInButton: BaseTextButton = {
        let button = BaseTextButton(type: .light(fontSize: 16))
        button.setTextLabel(text: "Sign In")
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [privacyButton, signInButton], axis: .horizontal, spacing: 14, distribution: .fill, aligment: .fill)
        return stackView
    }()
    
    private let sideConstraint: CGFloat = 16
    
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
        [logoImageView, buttonStackView].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        // Constraints
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: sideConstraint),
            logoImageView.widthAnchor.constraint(equalToConstant: 86),
            logoImageView.heightAnchor.constraint(equalToConstant: 22),
            
            buttonStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 12),
            buttonStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -sideConstraint),
        ])
        
        // Adding targets to buttons
        privacyButton.addTarget(self, action: #selector(tappedPrivacyButton), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(tappedSignInButton), for: .touchUpInside)
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
}
