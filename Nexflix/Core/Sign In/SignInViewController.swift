//
//  SignInViewController.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 12.01.2023.
//

import UIKit

final class SignInViewController: UIViewController {
    
    // MARK: - Properties

    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = .cornerRadius
        textField.backgroundColor = AppColors.greyDark
        textField.setLeftPaddingPoints(.padding)
        textField.attributedPlaceholder = NSAttributedString(
            string: "Email or phone number",
            attributes: [NSAttributedString.Key.foregroundColor: AppColors.grey])
        return textField
    }()
        
    private lazy var signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.setTitleColor(AppColors.lightGrey1, for: .normal)
        button.titleLabel?.font = AppFonts.boldRegularButton.font
        button.makeBorderedButton(borderWidth: 1, borderColor: AppColors.black.cgColor, cornerRadius: .cornerRadius, backgroundColor: .clear)
        button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var recoverPasswordButton: BaseTextButton = {
        let button = BaseTextButton()
        button.setTitle("Recover Password", for: .normal)
        button.setTitleColor(AppColors.lightGrey1, for: .normal)
        button.titleLabel?.font = AppFonts.smallBoldButton.font
        button.addTarget(self, action: #selector(recoverPasswordTapped), for: .touchUpInside)
        return button
    }()
    
    private let subtitle: BaseLabel = {
        let label = BaseLabel()
        label.textColor = AppColors.lightGrey1
        label.textAlignment = .center
        label.font = AppFonts.smallLight.font
        label.attributedText = "Sign in is protected by Google reCAPTCHA to ensure you're not a bot. Learn more.".withBoldText(text: "Learn more.", fontForRegularText: AppFonts.smallLight.font, sizeForBoldText: 12)
        return label
    }()
    
    private lazy var helpBarButtonItem = UIBarButtonItem(title: "Help", style: .plain, target: self, action: #selector(helpButtonPressed))
    
    private let passwordTextFieldView = PasswordTextFieldView()
    private var coordinator: SignInCoordinator
    
    // MARK: - Init
    
    init(coordinator: SignInCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTextField()
        setupUI()
    }
    
    // MARK: - SetupUI
    
    private func setupUI() {
        
        navigationItem.rightBarButtonItem = helpBarButtonItem
        navigationItem.titleView = UIImageView(image: UIImage(named: "logo"))
        
        view.backgroundColor = AppColors.greyDark2
        
        [emailTextField, passwordTextFieldView, signInButton, recoverPasswordButton, subtitle].forEach {
            view.addSubView($0, translatesAutoresizingMaskIntiConstraints: false)
        }
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .paddingLarge),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.paddingLarge),
            emailTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: .textFieldHeight),
            
            passwordTextFieldView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .paddingLarge),
            passwordTextFieldView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.paddingLarge),
            passwordTextFieldView.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -20),
            
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .paddingLarge),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.paddingLarge),
            signInButton.heightAnchor.constraint(equalToConstant: .buttonHeight),
            signInButton.bottomAnchor.constraint(equalTo: recoverPasswordButton.topAnchor, constant: -20),
            
            recoverPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .padding),
            recoverPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.padding),
            recoverPasswordButton.bottomAnchor.constraint(equalTo: subtitle.topAnchor, constant: -20),
            
            subtitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .paddingLarge),
            subtitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.paddingLarge)
        ])
    }
    
    private func setupTextField() {
        emailTextField.attributedPlaceholder = NSAttributedString(
            string: "Email or phone number",
            attributes: [NSAttributedString.Key.foregroundColor: AppColors.grey])
    }
    
    // MARK: - Actions
    
    @objc func signInButtonTapped() {
        coordinator.navigate(to: .signIn)
    }
    
    @objc func recoverPasswordTapped() {
        coordinator.navigate(to: .recoverPassword)
    }
    
    @objc func helpButtonPressed() {
        
    }
}


// VIEW MODEL - DATA BINDING
// COORDINATOR - NAVIGATION
