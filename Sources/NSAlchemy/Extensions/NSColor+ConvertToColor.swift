//
//  NSColor+ConvertToColor.swift
//  NSAlchemy
//
//  Created by Joshua Root on 12/11/24.
//

import SwiftUI

extension NSColor {
    func toColor() -> Color {
        return Color(nsColor: self)
    }
}
