//
//  BaseLabel.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 12.01.2023.
//


import UIKit

final class BaseLabel: UILabel {
    
    // MARK: - Init
    
    init() {
        super.init(frame: .zero)
        applyLabelFontStyles()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Styles for labels
    
    private func applyLabelFontStyles() {
        textColor = AppColors.white
        textAlignment = .left
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
        font = AppFonts.regular.font
    }
}
