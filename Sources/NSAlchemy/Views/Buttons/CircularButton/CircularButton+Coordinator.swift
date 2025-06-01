//
//  CircularButton+Coordinator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 6/1/25.
//

import Cocoa

@available(macOS 11.0, *)
public extension CircularButton {
	class Coordinator: NSResponder {
		var parent: CircularButton
		
		init(_ parent: CircularButton) {
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
