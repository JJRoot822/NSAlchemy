//
//  RatingControl.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/3/25.
//

import SwiftUI

/// A view for showing and editing a rating
@available(macOS 11.0, *)
public struct RatingControl: NSViewRepresentable {
	@Binding var value: Double
	
	var title: String
	
	var fillColor: NSColor
	
	var minValue: Double
	var maxValue: Double
	
	var fillImage: NSImage
	var placeholderImage: NSImage
	
	/// Creates a new RatingControl
	/// - Parameters:
	///   - title: The string to use as the RatingControl's accessibility label
	///   - value: A binding to the value of the control
	///   - min: The minimum rating allowed
	///   - max: The maximum rating allowed
	///   - image: The image to use as the fill image for the control. If this doesn't exist in your asset catalog or is an invalid SF Symbol, your app will crash.
	///   - placeholderImage: The image to use as the placeholder image for the control. If this doesn't exist in your asset catalog or is an invalid SF Symbol, your app will crash.
	public init(_ title: String, value: Binding<Double>, min: Double = 0, max: Double = 5, image: RatingImage, placeholderImage: RatingImage) {
		self.title = title
		self._value = value
		self.minValue = min
		self.maxValue = max
		self.fillColor = .systemYellow
		
		switch image {
		case .namedAsset(let assetName):
			self.fillImage = NSImage(imageLiteralResourceName: assetName)
		case .symbol(let symbol):
			if let symbolImage = NSImage(systemSymbolName: symbol, accessibilityDescription: nil) {
				self.fillImage = symbolImage
			} else {
				fatalError("Invalid SF Symbol. The fill image provided with the \"image\" parameter must be a valid SF Symbol when \"symbol\" is specified as the type of RatingImage.")
			}
		}
		
		switch placeholderImage {
		case .namedAsset(let assetName):
			self.placeholderImage = NSImage(imageLiteralResourceName: assetName)
		case .symbol(let symbol):
			if let symbolImage = NSImage(systemSymbolName: symbol, accessibilityDescription: nil) {
				self.placeholderImage = symbolImage
			} else {
				fatalError("Invalid SF Symbol. The placeholder image provided with the \"placeholderImage\" parameter must be a valid SF Symbol when \"symbol\" is specified as the type of RatingImage.")
			}
		}
	}
	
	public func makeNSView(context: Context) -> NSLevelIndicator {
		let indicator = NSLevelIndicator()
		indicator.levelIndicatorStyle = .rating
		indicator.doubleValue = value
		indicator.minValue = minValue
		indicator.maxValue = maxValue
		indicator.placeholderVisibility = .always
		indicator.fillColor = fillColor
		indicator.ratingImage = fillImage
		indicator.ratingPlaceholderImage = placeholderImage
		indicator.isEditable = true
		indicator.target = context.coordinator
		indicator.action = #selector(context.coordinator.valueChanged)
		indicator.setAccessibilityLabel(title)
		return indicator
	}
	
	public func updateNSView(_ nsView: NSLevelIndicator, context: Context) {
		nsView.doubleValue = value
		
		nsView.fillColor = fillColor
	}
	
	public func makeCoordinator() -> Coordinator {
		return Coordinator(self)
	}
}
