//
//  UIStackView+Extensions.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 12.01.2023.
//

import UIKit

extension UIStackView {
    
    // MARK: - Adding arranged subviews to the stackView with property initialization

    convenience init(arrangedSubviews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat, distribution: UIStackView.Distribution, aligment: UIStackView.Alignment) {
        self.init(arrangedSubviews: arrangedSubviews)
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
        self.alignment = aligment
        translatesAutoresizingMaskIntoConstraints = false
    }
}

