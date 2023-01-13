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
    case medium(fontSize: CGFloat)
    case mediumHeader
    case bold(fontSize: CGFloat)
    case boldHeader
}

final class BaseLabel: UILabel {
    
    // MARK: - Init
    
    init(type: LabelFontStyle = .medium(fontSize: 16)) {
        super.init(frame: .zero)
        applyLabelFontStyles(type: type)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Styles for labels
    
    private func applyLabelFontStyles(type: LabelFontStyle) {
        textColor = AppColors.white
        textAlignment = .left
        lineBreakMode = .byWordWrapping
        numberOfLines = 0
        
        switch type {
        case .light(let fontSize):
            font = UIFont(name: "Inter-Light", size: fontSize)
        case .lightHeader:
            font = UIFont(name: "Inter-Light", size: 32)
            textAlignment = .center
        case .medium:
            font = UIFont(name: "Inter-Medium", size: 16)
        case .mediumHeader:
            font = UIFont(name: "Inter-Medium", size: 32)
            textAlignment = .center
        case .bold:
            font = UIFont(name: "Inter-Bold", size: 16)
        case .boldHeader:
            font = UIFont(name: "Inter-Bold", size: 32)
            textAlignment = .center
        }
    }
}
