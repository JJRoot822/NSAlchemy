//
//  Color+ConvertToNSColor.swift
//  NSAlchemy
//
//  Created by Joshua Root on 11/24/24.
//

import SwiftUI

extension Color {
    @available(macOS 11.0, *)
    public static func nsColor(from color: Color) -> NSColor {
        return NSColor(color)
    }
}
