//
//  UILabel+Extensions.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 13.01.2023.
//

import UIKit

extension UILabel {
    
    // MARK: - Adding an interline spacing for labels
    
    func addInterlineSpacing(spacingValue: CGFloat = 2) {
        guard let textString = text else { return }
        let attributedString = NSMutableAttributedString(string: textString)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacingValue
        attributedString.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length))
        
        attributedText = attributedString
    }
}
