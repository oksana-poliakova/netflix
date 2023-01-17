//
//  NSAttributedString+Extensions.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 16.01.2023.
//

import Foundation
import UIKit

extension String {
    
    // MARK: - Make part of string bold
    
    func withBoldText(text: String, fontForRegularText: UIFont? = nil, sizeForBoldText: CGFloat) -> NSAttributedString {
        let _font = fontForRegularText ?? UIFont.systemFont(ofSize: 14, weight: .regular)
        let fullString = NSMutableAttributedString(string: self,
                                                   attributes: [NSAttributedString.Key.font: _font])
        let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: AppFonts.customSizeBold(size: sizeForBoldText).font]
        let range = (self as NSString).range(of: text)
        fullString.addAttributes(boldFontAttribute, range: range)
        return fullString
    }
}
