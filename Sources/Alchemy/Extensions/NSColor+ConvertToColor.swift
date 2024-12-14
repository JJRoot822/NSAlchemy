//
//  NSColor+ConvertToColor.swift
//  NSAlchemy
//
//  Created by Joshua Root on 12/11/24.
//

import SwiftUI

extension NSColor {
    @available(macOS 12.0, *)
    public func toColor() -> Color {
        return Color(nsColor: self)
    }
}
