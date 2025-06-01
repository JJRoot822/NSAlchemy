//
//  GradientButton+Coordinator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/31/25.
//

import Cocoa

@available(macOS 11.0, *)
public extension GradientButton {
	class Coordinator: NSResponder {
		var parent: GradientButton
		
		init(_ parent: GradientButton) {
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
