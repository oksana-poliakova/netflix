//
//  DetailScreenViewController.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 10.04.2023.
//

import UIKit
import SwiftUI

final class DetailScreenViewController: UIViewController {
    
    // MARK: - Properties
    
    private var coordinator: DetailScreenCoordinator
    private let detailScreenView: DetailScreenView
    
    // MARK: - Init
    
    init(coordinator: DetailScreenCoordinator, model: Title) {
        self.coordinator = coordinator
        self.detailScreenView = DetailScreenView(title: model)
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
        let hostingController = UIHostingController(rootView: detailScreenView)
        addChild(hostingController)
        view.addSubview(hostingController.view)
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        hostingController.didMove(toParent: self)
    }
}
