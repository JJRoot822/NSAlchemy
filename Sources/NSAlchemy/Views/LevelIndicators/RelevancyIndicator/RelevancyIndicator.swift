//
//  RelevancyIndicator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/4/25.
//

import SwiftUI

/// A view for displaying relevancy
@available(macOS 11.0, *)
public struct RelevancyIndicator: NSViewRepresentable {
	var value: Double
	var title: String
	var fillColor: NSColor
	
	var minValue: Double
	var maxValue: Double
	
	/// Creates a new RelevancyIndicator
	/// - Parameters:
	///   - title: The string to use as the RelevancyIndicator's accessibility label
	///   - value: The relevancy value to display
	///   - min: The minimum relevancy value allowed
	///   - max: The maximum relevancy value allowed
	public init(_ title: String, value: Double, min: Double = 0, max: Double = 1) {
		self.title = title
		self.value = value
		self.minValue = min
		self.maxValue = max
		self.fillColor = .systemBlue
	}
	
	public func makeNSView(context: Context) -> NSLevelIndicator {
		let indicator = NSLevelIndicator()
		indicator.levelIndicatorStyle = .relevancy
		indicator.doubleValue = value
		indicator.minValue = minValue
		indicator.maxValue = maxValue
		indicator.fillColor = fillColor
		indicator.isEditable = false
		
		indicator.setAccessibilityLabel(title)
		
		return indicator
	}
	
	public func updateNSView(_ nsView: NSLevelIndicator, context: Context) {
		nsView.fillColor = fillColor
	}
}


