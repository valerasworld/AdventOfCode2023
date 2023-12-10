//
//  Color.swift
//  AdventOfCode2023
//
//  Created by Валерий Зазулин on 10.12.2023.
//

import Foundation
import SwiftUI

extension Color {
    
    static let theme = ColorTheme()
    
}

struct ColorTheme {
    
    let regular = Color("RegularTextColor")
    let accentGreen = Color("AccentColor")
    let background = Color("BackgroundColor")
    let glowingGreen = Color("GlowingGreenColor")
    let glowingWhite = Color("GlowingWhiteColor")
    let glowingYellow = Color("GlowingYellowColor")
    let boxBackground = Color("BoxBackgroundColor")
    let boxStroke = Color("BoxStrokeColor")
  
}
