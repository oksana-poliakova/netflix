//
//  BaseTextButton.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 12.01.2023.
//

import UIKit

final class BaseTextButton: UIButton {
    
    private var textLabel: BaseLabel
    
    // MARK: - Init
    
    init(type: LabelFontStyle = .light(fontSize: 16)) {
        textLabel = BaseLabel(type: type)
        super.init(frame: .zero)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Apply styles
    
    private func setupUI() {
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        
        addSubview(textLabel)
        
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
