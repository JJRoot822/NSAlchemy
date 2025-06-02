//
//  AccessoryBarActionButton.swift
//  NSAlchemy
//
//  Created by Joshua Root on 6/2/25.
//

import SwiftUI

/// A button used in accessory toolbars to execute some kind of action.
@available(macOS 10.15, *)
public struct AccessoryBarActionButton: NSViewRepresentable {
	var title: String
	var action: () -> Void
	
	/// Creates a new AccessoryBarActionButton
	/// - Parameters:
	///   - title: the title of the button
	///   - action: The action to be executed when the button is clicked
	public init(title: String, action: @escaping (() -> Void)) {
		self.title = title
		self.action = action
	}
	
	public func makeNSView(context: Context) -> NSButton {
		let button = NSButton(title: title, target: context.coordinator, action: #selector(context.coordinator.buttonClicked))
		button.bezelStyle = .accessoryBarAction
		
		return button
	}
	
	public func updateNSView(_ nsView: NSButton, context: Context) {}
	
	public func makeCoordinator() -> Coordinator {
		return Coordinator(self)
	}
}

