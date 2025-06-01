//
//  RecessedButton.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/31/25.
//

import SwiftUI

@available(macOS, introduced: 10.15, deprecated: 15.5, message: "RecessedButton shouldn't be used in macOS 15.5 or later.")
public struct RecessedButton: NSViewRepresentable {
	var title: String
	
	@Binding var isOn: Bool
	
	init(title: String, isOn: Binding<Bool>) {
		self.title = title
		self._isOn = isOn
	}
	
	public func makeNSView(context: Context) -> NSButton {
		let button = NSButton(title: title, target: context.coordinator, action: #selector(context.coordinator.buttonClicked))
		button.bezelStyle = .recessed
		button.setButtonType(.pushOnPushOff)
		button.state = isOn ? .on : .off
		
		return button
	}
	
	public func updateNSView(_ nsView: NSButton, context: Context) {
		nsView.state = isOn ? .on : .off
	}
	
	public func makeCoordinator() -> Coordinator {
		return Coordinator(self)
	}
}

