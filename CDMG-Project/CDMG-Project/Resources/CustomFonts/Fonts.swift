//
//  Fonts.swift
//  CDMG-Project
//
//  Created by Nguyen Minh Tam on 05/09/2022.
//

import UIKit

public struct Fonts {
    
    public enum FontStyle: String {
        
        case font_roboto_bold = "roboto_bold"
        case font_roboto_medium = "roboto_medium"
        case font_roboto_light = "roboto_light"
        case font_roboto_regular = "roboto_regular"
        
    }
    
    static func getFontStyle(style: FontStyle, size: CGFloat = 14) -> UIFont {
        
        return UIFont(name: style.rawValue, size: size) ?? UIFont.systemFont(ofSize: 14)
        
    }
    
}
