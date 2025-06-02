//
//  CircularButton.swift
//  NSAlchemy
//
//  Created by Joshua Root on 6/1/25.
//

import SwiftUI

/// A button intended for an image or singular character
@available(macOS 11.0, *)
public struct CircularButton: NSViewRepresentable {
	var title: String
	var accessibilityLabel: String
	var imageType: CircularButtonImageType
	var action: () -> Void
	
	/// Creates a new CircularButton
	/// - Parameters:
	///   - title: The single character to be used as the button's title
	///   - accessibilityLabel: The button's accessibility label to convey a full label to assistive technologies
	///   - action: The action to be executed when the button is clicked
	public init(title: Character, accessibilityLabel: String, action: @escaping (() -> Void)) {
		self.title = String(title)
		self.accessibilityLabel = accessibilityLabel
		self.imageType = .noImage
		self.action = action
	}
	
	/// Creates a new CircularButton
	/// - Parameters:
	///   - title: The title of the button to be used as the button's accessibility label
	///   - image: The kind of image to be used as the button's content
	///   - action: The action to be executed when the button is clicked
	public init(title: String, image: CircularButtonImageType, action: @escaping (() -> Void)) {
		self.title = title
		self.accessibilityLabel = title
		self.imageType = image
		self.action = action
	}
	
	public func makeNSView(context: Context) -> NSButton {
		let button = NSButton()
		button.bezelStyle = .circular
		button.target = context.coordinator
		button.action = #selector(context.coordinator.buttonClicked)
		
		switch imageType {
		case .noImage:
			button.title = title
		case .asset(let name):
			button.image = NSImage(imageLiteralResourceName: name)
			button.setAccessibilityLabel(accessibilityLabel)
		case .symbol(let name):
			button.image = NSImage(systemSymbolName: name, accessibilityDescription: nil)
			button.setAccessibilityLabel(accessibilityLabel)
		}
		
		return button
	}
	
	public func updateNSView(_ nsView: NSButton, context: Context) {}
	
	public func makeCoordinator() -> Coordinator {
		return Coordinator(self)
	}
}

