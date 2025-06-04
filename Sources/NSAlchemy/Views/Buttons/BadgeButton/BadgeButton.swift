//
//  BadgeButton.swift
//  NSAlchemy
//
//  Created by Joshua Root on 6/1/25.
//

import SwiftUI

/// A button meant to convey additional information in the format of a badge
@available(macOS 10.15, *)
public struct BadgeButton: NSViewRepresentable {
	var title: String
	var action: () -> Void
	
	/// Creates a new BadgeButton
	/// - Parameters:
	///   - title: The button's title
	///   - action: The action to be executed when the button is clicked
	public init(_ title: String, action: @escaping (() -> Void)) {
		self.title = title
		self.action = action
	}
	
	public func makeNSView(context: Context) -> NSButton {
		let button = NSButton(title: title, target: context.coordinator, action: #selector(context.coordinator.buttonClicked))
		button.bezelStyle = .badge
		
		return button
	}
	
	public func updateNSView(_ nsView: NSButton, context: Context) {}
	
	public func makeCoordinator() -> Coordinator {
		return Coordinator(self)
	}
}
