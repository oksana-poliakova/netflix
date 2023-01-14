//
//  UIView+Extensions.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 14.01.2023.
//

import UIKit

extension UIView {
    
    // MARK: - Adding subviews
    
    func addSubView(_ view: UIView, translatesAutoresizingMaskIntiConstraints: Bool) {
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
    }
}
