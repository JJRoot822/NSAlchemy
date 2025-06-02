//
//  AccessoryBarActionButton+Coordinator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 6/2/25.
//

import Cocoa

@available(macOS 10.15, *)
public extension AccessoryBarActionButton {
	class Coordinator: NSResponder {
		var parent: AccessoryBarActionButton
		
		init(_ parent: AccessoryBarActionButton) {
			self.parent = parent
		
			super.init()
		}
		
		required init?(coder: NSCoder) {
			fatalError("Not Supported")
		}
		
		@objc func buttonClicked() {
			parent.action()
		}
	}
}
