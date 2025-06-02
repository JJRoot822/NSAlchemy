//
//  DisclosureTriangleButton.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/31/25.
//

import SwiftUI

///A standalone disclosure triangle button
@available(macOS 10.15, *)
public struct DisclosureTriangleButton: NSViewRepresentable {
	var title: String
	
	@Binding var isOn: Bool
	
	/// Creates a new standalone disclosure triangle button
	/// - Parameters:
	///   - title: The title used for the button's accessibility label
	///   - isOn: A binding to whether or not the disclosure triangle is expanded or collapsed
	public init(title: String, isOn: Binding<Bool>) {
		self.title = title
		self._isOn = isOn
	}
	
	public func makeNSView(context: Context) -> NSButton {
		let button = NSButton()
		button.setAccessibilityLabel(title)
		button.bezelStyle = .disclosure
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
