//
//  RoundedDisclosureButton+Coordinator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/31/25.
//

import Cocoa

@available(macOS, introduced: 10.15, deprecated: 15.5, message: "RoundedDisclosureButton shouldn't be used on macOS 15.5 and later. Use DisclosureButton instead.")
public extension RoundedDisclosureButton {
	class Coordinator: NSResponder {
		var parent: RoundedDisclosureButton
		
		init(_ parent: RoundedDisclosureButton) {
			self.parent = parent
		
			super.init()
		}
		
		required init?(coder: NSCoder) {
			fatalError("Not supported")
		}
		
		@objc func buttonClicked() {
			parent.isOn.toggle()
		}
	}
}


