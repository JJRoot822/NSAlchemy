//
//  FlexibleButton.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/31/25.
//

import SwiftUI

@available(macOS 10.15, *)
public struct FlexibleButton: NSViewRepresentable {
	var title: String
	var action: () -> Void
	
	public init(title: String, action: @escaping (() -> Void)) {
		self.title = title
		self.action = action
	}
	
	public func makeNSView(context: Context) -> NSButton {
		let button = NSButton(title: title, target: context.coordinator, action: #selector(context.coordinator.buttonClicked))
		button.bezelStyle = .flexiblePush
		
		return button
	}
	
	public func updateNSView(_ nsView: NSButton, context: Context) {}
	
	public func makeCoordinator() -> Coordinator {
		return Coordinator(self)
	}
}
