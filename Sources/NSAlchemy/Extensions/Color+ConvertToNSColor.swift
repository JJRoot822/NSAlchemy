//
//  Color+ConvertToNSColor.swift
//  NSAlchemy
//
//  Created by Joshua Root on 11/24/24.
//

import SwiftUI

extension Color {
    public static func nsColor(from color: Color) -> NSColor {
        return NSColor(color)
    }
}
