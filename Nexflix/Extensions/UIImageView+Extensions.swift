//
//  UIImageView+Extensions.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 16.01.2023.
//

import UIKit

extension UIImageView {
    
    // MARK: - Make a rounded image
    
    func makeRounded() {
        layer.masksToBounds = false
        layer.cornerRadius = self.frame.height / 2
        clipsToBounds = true
    }
}
