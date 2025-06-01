//
//  RoundedDisclosureButton.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/31/25.
//

import SwiftUI

@available(macOS, introduced: 10.15, deprecated: 15.5, message: "RoundedDisclosureButton shouldn't be used on macOS 15.5 and later. Use DisclosureButton instead.")
public struct RoundedDisclosureButton: NSViewRepresentable {
	var title: String
	
	@Binding var isOn: Bool
	
	public init(title: String, isOn: Binding<Bool>) {
		
		self.title = title
		self._isOn = isOn
	}
	
	public func makeNSView(context: Context) -> NSButton {
		let button = NSButton()
		button.setAccessibilityLabel(title)
		button.bezelStyle = .roundedDisclosure
		button.setButtonType(.pushOnPushOff)
		button.state = isOn ? .on : .off
		button.target = context.coordinator
		button.action = #selector(context.coordinator.buttonClicked)
		
		return button
	}
	
	public func updateNSView(_ nsView: NSButton, context: Context) {
		nsView.state = isOn ? .on : .off
	}
	
	public func makeCoordinator() -> Coordinator {
		return Coordinator(self)
	}
}


