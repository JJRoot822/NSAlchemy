//
//  FlexibleButton+Coordinator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/31/25.
//

import Cocoa

@available(macOS 10.15, *)
public extension FlexibleButton {
	class Coordinator: NSResponder {
		var parent: FlexibleButton
		
		init(_ parent: FlexibleButton) {
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
