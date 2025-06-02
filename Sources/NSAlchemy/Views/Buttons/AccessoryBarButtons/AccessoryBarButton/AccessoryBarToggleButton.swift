//
//  AccessoryBarToggleButton.swift
//  NSAlchemy
//
//  Created by Joshua Root on 6/2/25.
//

import SwiftUI

@available(macOS 10.15, *)
public struct AccessoryBarToggleButton: NSViewRepresentable {
	var title: String
	
	@Binding var isOn: Bool
	
	public init(title: String, isOn: Binding<Bool>) {
		self.title = title
		self._isOn = isOn
	}
	
	public func makeNSView(context: Context) -> NSButton {
		let button = NSButton(title: title, target: context.coordinator, action: #selector(context.coordinator.buttonClicked))
		button.bezelStyle = .accessoryBar
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
