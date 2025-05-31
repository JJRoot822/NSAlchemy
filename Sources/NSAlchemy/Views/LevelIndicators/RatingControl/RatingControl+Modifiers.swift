//
//  RatingControl+Modifiers.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/4/25.
//

import SwiftUI

@available(macOS 11.0, *)
public extension RatingControl {
	/// A modifier for specifying the fill color of the RatingControl's fill image
	/// - Parameter color: The color to use for the fill image
	/// - Returns: The modified RatingControl
	func ratingFillColor(_ color: Color) -> RatingControl {
		var control = self
		control.fillColor = NSColor(color)
		
		return control
	}
}
