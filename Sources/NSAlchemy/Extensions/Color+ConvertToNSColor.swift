//
//  Color+ConvertToNSColor.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/4/25.
//

import SwiftUI

@available(macOS 11.0, *)
public extension Color {
	static func nsColor(from color: Color) -> NSColor {
		return NSColor(color)
	}
}
