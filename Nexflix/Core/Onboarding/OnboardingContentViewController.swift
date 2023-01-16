//
//  OnboardingContentViewController.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 13.01.2023.
//

import UIKit

final class OnboardingContentViewController: UIViewController {
    
    // MARK: - Properties
    
    private let screenImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let titleLabel: BaseLabel = {
        let label = BaseLabel()
        label.font = AppFonts.mediumHeader.font
        label.textAlignment = .center
        return label
    }()
    
    private let subtitleLabel: BaseLabel = {
        let label = BaseLabel()
        label.font = AppFonts.medium.font
        return label
    }()
    
    var index: Int = 0
    weak var coordinator: AppCoordinator?
    
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
            view.addSubView($0, translatesAutoresizingMaskIntiConstraints: false)
        }
        
        // Constraints 
        NSLayoutConstraint.activate([
            screenImageView.topAnchor.constraint(equalTo: view.topAnchor),
            screenImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            screenImageView.heightAnchor.constraint(equalToConstant: 250),
            screenImageView.widthAnchor.constraint(equalToConstant: 300),
            screenImageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -30),
            
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.padding),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 45),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -45)
        ])
    }
}
