//
//  RecessedButton+Coordinator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/31/25.
//

import Cocoa

@available(macOS, introduced: 10.15, deprecated: 15.5, message: "RecessedButton shouldn't be used in macOS 15.5 or later.")
public extension RecessedButton {
	class Coordinator: NSResponder {
		var parent: RecessedButton
		
		init(_ parent: RecessedButton) {
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
