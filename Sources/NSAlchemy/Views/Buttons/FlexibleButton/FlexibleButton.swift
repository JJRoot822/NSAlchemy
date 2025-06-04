//
//  FlexibleButton.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/31/25.
//

import SwiftUI

/// A button with a flexible height and customizable placement of an optional image
@available(macOS 11.0, *)
public struct FlexibleButton: NSViewRepresentable {
	var title: String
	var imageType: FlexibleButtonImageType
	var imagePosition: FlexibleButtonImagePosition?
	var action: () -> Void
	
	/// Creates a new FlexibleButton
	/// - Parameters:
	///   - title: The title of the Button
	///   - image: The kind of image you want to use for this button
	///   - position: The position of the button's image
	///   - action: The code to execute when the button is clicked
	public init(_ title: String, image: FlexibleButtonImageType, position: FlexibleButtonImagePosition? = nil, action: @escaping (() -> Void)) {
		self.title = title
		self.imageType = image
		self.imagePosition = position
		self.action = action
	}
	
	public func makeNSView(context: Context) -> NSButton {
		let button = NSButton(title: title, target: context.coordinator, action: #selector(context.coordinator.buttonClicked))
		button.bezelStyle = .flexiblePush
	
		switch imageType {
		case .noImage:
			button.image = nil
			button.imagePosition = .noImage
		case .asset(let name):
			button.image = NSImage(imageLiteralResourceName: name)
			
			if let position = imagePosition {
				button.imagePosition = position.cocoaPosition
			} else {
				button.imagePosition = .imageLeading
			}
		case .symbol(let name):
			button.image = NSImage(systemSymbolName: name, accessibilityDescription: nil)
			
			if let position = imagePosition {
				button.imagePosition = position.cocoaPosition
			} else {
				button.imagePosition = .imageLeading
			}
		}
		
		return button
	}
	
	public func updateNSView(_ nsView: NSButton, context: Context) {}
	
	public func makeCoordinator() -> Coordinator {
		return Coordinator(self)
	}
}
