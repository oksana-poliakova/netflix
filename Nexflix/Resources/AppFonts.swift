//
//  AppFonts.swift
//  Nexflix
//
//  Created by Oksana Poliakova on 14.01.2023.
//

import UIKit

// MARK: - Font styles

enum AppFonts {
    
    static let smallFontSize: CGFloat = 12
    static let regularFontSize: CGFloat = 16
    static let mediumFontSize: CGFloat = 18
    static let largeFontSize: CGFloat = 20
    static let headerFontSize: CGFloat = 32
    static let smallButtonFontSize: CGFloat = 14
    static let buttonFontSize: CGFloat = 18
    
    case light
    case smallLight
    case lightHeader
    case regular
    case regularBold
    case regularButton
    case medium
    case mediumHeader
    case bold
    case smallBoldButton
    case boldRegularButton
    case boldHeader
    
    var font: UIFont {
        switch self {
        case .light:
            return UIFont(name: "Inter-Light", size: AppFonts.regularFontSize) ?? UIFont()
        case .smallLight:
            return UIFont(name: "Inter-Light", size: AppFonts.smallFontSize) ?? UIFont()
        case .lightHeader:
            return UIFont(name: "Inter-Light", size: AppFonts.headerFontSize) ?? UIFont()
        case .regular:
            return UIFont(name: "Inter-Regular", size: AppFonts.regularFontSize) ?? UIFont()
        case .regularBold:
            return UIFont(name: "Inter-Bold", size: AppFonts.regularFontSize) ?? UIFont()
        case .regularButton:
            return UIFont(name: "Inter-Regular", size: AppFonts.buttonFontSize) ?? UIFont()
        case .medium:
            return UIFont(name: "Inter-Medium", size: AppFonts.mediumFontSize) ?? UIFont()
        case .mediumHeader:
            return UIFont(name: "Inter-Medium", size: AppFonts.headerFontSize) ?? UIFont()
        case .smallBoldButton:
            return UIFont(name: "Inter-Bold", size: AppFonts.smallButtonFontSize) ?? UIFont()
        case .bold:
            return UIFont(name: "Inter-Bold", size: AppFonts.regularFontSize) ?? UIFont()
        case .boldHeader:
            return UIFont(name: "Inter-Bold", size: AppFonts.headerFontSize) ?? UIFont()
        case .boldRegularButton:
            return UIFont(name: "Inter-Bold", size: AppFonts.buttonFontSize) ?? UIFont()
        }
    }
}
