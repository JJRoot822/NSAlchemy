//
//  RelevancyIndicator+Modifiers.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/4/25.
//

import SwiftUI

@available(macOS 11.0, *)
public extension RelevancyIndicator {
	/// A modifier to specify the color used to fill the indicator
	/// - Parameter color: The color to use for the indicator
	/// - Returns: The modified RelevancyIndicator
	func fillColor(_ color: Color) -> RelevancyIndicator {
		var indicator = self
		indicator.fillColor = NSColor(color)
		
		return indicator
	}
}

