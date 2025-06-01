//
//  BadgeButton+Coordinator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 6/1/25.
//

import Cocoa

public extension BadgeButton {
	class Coordinator: NSResponder {
		var parent: BadgeButton
		
		init(_ parent: BadgeButton) {
			self.parent = parent
			
			super.init()
		}
		
		required init?(coder: NSCoder) {
			fatalError("Not supported")
		}
		
		@objc func buttonClicked() {
			parent.action()
		}
	}
}
