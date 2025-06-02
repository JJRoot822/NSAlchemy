//
//  AccessoryBarToggleButton+Coordinator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 6/2/25.
//

import Cocoa

@available(macOS 10.15, *)
public extension AccessoryBarToggleButton {
	class Coordinator: NSResponder {
		var parent: AccessoryBarToggleButton
		
		init(_ parent: AccessoryBarToggleButton) {
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
