//
//  OnboardingContentViewController.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 13.01.2023.
//

import UIKit

final class OnboardingContentViewController: UIViewController {
    
    // MARK: - Properties
    
    private lazy var screenImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: BaseLabel = {
        let label = BaseLabel(type: .mediumHeader)
        return label
    }()
    
    private lazy var subtitleLabel: BaseLabel = {
        let label = BaseLabel(type: .medium(fontSize: 18))
        return label
    }()
    
    var index: Int = 0
    
    // MARK: - Init
    
    init(onboarding: Onboarding) {
        super.init(nibName: nil, bundle: nil)
        
        screenImageView.image = onboarding.image
        titleLabel.text = onboarding.title
        subtitleLabel.text = onboarding.subtitle
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
        
        subtitleLabel.addInterlineSpacing(spacingValue: 4)
        subtitleLabel.textAlignment = .center

        // Appearance
        [screenImageView, titleLabel, subtitleLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview($0)
        }
        
        // Constraints 
        NSLayoutConstraint.activate([
            screenImageView.topAnchor.constraint(equalTo: view.topAnchor),
            screenImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            screenImageView.heightAnchor.constraint(equalToConstant: 250),
            screenImageView.widthAnchor.constraint(equalToConstant: 300),
            screenImageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -30),
            
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45)
        ])
    }
}