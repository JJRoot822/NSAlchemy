//
//  Color+ConvertToNSColor.swift
//  NSAlchemy
//
//  Created by Joshua Root on 11/24/24.
//

import SwiftUI

extension Color {
    static func nsColor(from color: Color) -> NSColor {
        switch color {
        case .accentColor:
            return .controlAccentColor
        case .black:
            return .black
        case .blue:
            return .systemBlue
        case .brown:
            return .systemBrown
        case .clear:
            return .clear
        case .cyan:
            return .systemCyan
        case .gray:
            return .systemGray
        case .red:
            return .systemRed
        case .green:
            return .systemGreen
        case .orange:
            return .systemOrange
        case .pink:
            return .systemPink
        case .indigo:
            return .systemIndigo
        case .mint:
            return .systemMint
        case .purple:
            return .systemPurple
        case .secondary:
            return .secondaryLabelColor
        case .teal:
            return .systemTeal
        case .white:
            return .white
        case .yellow:
            return .systemYellow
        default:
            return .controlAccentColor
        }
    }
}
