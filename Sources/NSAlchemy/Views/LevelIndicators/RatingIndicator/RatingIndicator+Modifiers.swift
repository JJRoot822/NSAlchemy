//
//  RatingIndicator+Modifiers.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/4/25.
//

import SwiftUI

@available(macOS 11.0, *)
public extension RatingIndicator {
	/// A modifier to specify the color used to fill the indicator's fill image
	/// - Parameter color: The color to use for the fill image
	/// - Returns: The modified RatingIndicator
	func ratingFillColor(_ color: Color) -> RatingIndicator {
		var indicator = self
		indicator.fillColor = NSColor(color)
		
		return indicator
	}
}
