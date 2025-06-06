//
//  GradientButton.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/31/25.
//

import SwiftUI

/// A button for performing actions on a related view, such as adding items to a table
@available(macOS 11.0, *)
public struct GradientButton: NSViewRepresentable {
	var title: String
	var imageType: GradientButtonImageType
	var action: () -> Void
	
	/// Creates a new GradientButton
	/// - Parameters:
	///   - title: The title of the button to be used as it's accessibility label
	///   - image: The kind of image to be used as the button's content
	///   - action: The action to be executed when the button is clicked
	public init(_ title: String, image: GradientButtonImageType, action: @escaping (() -> Void)) {
		self.title = title
		self.imageType = image
		self.action = action
	}
	
	public func makeNSView(context: Context) -> NSButton {
		let button = NSButton()
		button.bezelStyle = .smallSquare
		button.setAccessibilityLabel(title)
		button.target = context.coordinator
		button.action = #selector(context.coordinator.buttonClicked)
		
		switch imageType {
		case .asset(let name):
			let image = NSImage(imageLiteralResourceName: name)
			button.image = image
		case .symbol(let name):
			let image = NSImage(systemSymbolName: name, accessibilityDescription: nil)
			button.image = image
		}
		return button
	}
	
	public func updateNSView(_ nsView: NSButton, context: Context) {}
	
	public func makeCoordinator() -> Coordinator {
		return Coordinator(self)
	}
}

