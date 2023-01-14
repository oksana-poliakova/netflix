//
//  PasswordTextFieldView.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 14.01.2023.
//

import UIKit

class PasswordTextFieldView: UIView {
    
    // MARK: - Properties
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.layer.cornerRadius = .cornerRadius
        textField.backgroundColor = AppColors.greyDark
        return textField
    }()
    
    private lazy var showButton: UIButton = {
        let button = UIButton()
        button.setTitle("SHOW", for: .normal)
        button.titleLabel?.font = AppFonts.regular.font
        button.setTitleColor(AppColors.grey, for: .normal)
        button.addTarget(self, action: #selector(pressedShowButton), for: .touchUpInside)
        return button
    }()

    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        
        setupTextField()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UI
    
    private func setupUI() {
        [passwordTextField, showButton].forEach {
            addSubView($0, translatesAutoresizingMaskIntiConstraints: false)
        }
        
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: topAnchor),
            passwordTextField.bottomAnchor.constraint(equalTo: bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: .textFieldHeight),
            
            showButton.topAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: 10),
            showButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -10),
            showButton.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: -10)
        ])
    }
    
    // MARK: - Setup text field
    
    private func setupTextField() {
        passwordTextField.isSecureTextEntry = true
        passwordTextField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: AppColors.grey])
        passwordTextField.setLeftPaddingPoints(.padding)
        passwordTextField.setRightPaddingPoints(.padding)
    }
    
    private func tooglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
        
        if passwordTextField.isSecureTextEntry == true {
            showButton.setTitle("SHOW", for: .normal)
        } else {
            showButton.setTitle("HIDE", for: .normal)
        }
    }
    
    // MARK: - Actions
    
    @objc func pressedShowButton() {
        tooglePasswordVisibility()
    }
}
