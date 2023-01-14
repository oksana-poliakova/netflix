//
//  UIButton+Extensions.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 14.01.2023.
//

import UIKit

extension UIButton {
    
    // MARK: - Make a bordered button
    
    func makeBorderedButton(borderWidth: CGFloat = 0,
                            borderColor: CGColor = UIColor.clear.cgColor,
                            cornerRadius: CGFloat,
                            backgroundColor: UIColor) {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor
        layer.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
    }
}
