//
//  BaseLabel.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 12.01.2023.
//


import UIKit

// MARK: - Font styles for a basic label

enum LabelFontStyle {
    case light(fontSize: CGFloat)
    case lightHeader
    case medium
    case mediumHeader
    case bold
    case boldHeader
}

final class BaseLabel: UILabel {
    
    // MARK: - Init
    
    init(type: LabelFontStyle = .medium) {
        super.init(frame: .zero)
        applyLabelFontStyles(type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Styles for label
    
    private func applyLabelFontStyles(type: LabelFontStyle) {
        textColor = AppColors.white
        textAlignment = .left
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
        
        switch type {
        case .light(let fontSize):
            font = UIFont(name: "Inter-Light.ttf", size: fontSize)
        case .lightHeader:
            font = UIFont(name: "Inter-Light.ttf", size: 32)
            textAlignment = .center
        case .medium:
            font = UIFont(name: "Inter-Medium.ttf", size: 16)
        case .mediumHeader:
            font = UIFont(name: "Inter-Light.ttf", size: 32)
            textAlignment = .center
        case .bold:
            font = UIFont(name: "Inter-Bold.ttf", size: 16)
        case .boldHeader:
            font = UIFont(name: "Inter-Light.ttf", size: 32)
            textAlignment = .center
        }
    }
}
