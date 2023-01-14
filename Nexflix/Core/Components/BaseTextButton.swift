//
//  BaseTextButton.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 12.01.2023.
//

import UIKit

final class BaseTextButton: UIButton {
    
    // MARK: - Properties
    
    private var textLabel: BaseLabel
    
    // MARK: - Init
    
    init() {
        textLabel = BaseLabel()
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - SetupUI
    
    private func setupUI() {
        backgroundColor = .clear
        
        addSubView(textLabel, translatesAutoresizingMaskIntiConstraints: false)
        
        NSLayoutConstraint.activate([
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel.topAnchor.constraint(equalTo: topAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func setTextLabel(text: String) {
        textLabel.text = text
    }
}
