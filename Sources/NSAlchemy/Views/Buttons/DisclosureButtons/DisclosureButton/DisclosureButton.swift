//
//  DisclosureButton.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/31/25.
//

import SwiftUI

/// A disclosure button for expanding or collapsing content specific to the context of another view such as file location selection
@available(macOS 10.15, *)
public struct DisclosureButton: NSViewRepresentable {
	var title: String
	
	@Binding var isOn: Bool
	
	/// Creates a new DisclosureButton
	/// - Parameters:
	///   - title: The title used as the button's accessibility label
	///   - isOn: A binding to whether or not the button is in an expanded or collapsed state
	public init(_ title: String, isOn: Binding<Bool>) {
		self.title = title
		self._isOn = isOn
	}
	
	public func makeNSView(context: Context) -> NSButton {
		let button = NSButton()
		button.setAccessibilityLabel(title)
		button.bezelStyle = .pushDisclosure
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

