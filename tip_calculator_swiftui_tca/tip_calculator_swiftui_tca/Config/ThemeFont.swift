//
//  ThemeFont.swift
//  tip-calculator
//
//  Created by dasol lee on 2023/08/24.
//

import SwiftUI

struct ThemeFont {
    static func regular(ofSize size: CGFloat) -> Font {
        return .custom("AvenirNext-Regular", size: size)
    }
    
    static func bold(ofSize size: CGFloat) -> Font {
        return .custom("AvenirNext-Bold", size: size)
    }
    
    static func demibold(ofSize size: CGFloat) -> Font {
        return .custom("AvenirNext-DemiBold", size: size)
    }
}

