//
//  RatingControl+Coordinator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/4/25.
//

import AppKit

@available(macOS 11.0, *)
public extension RatingControl {
	class Coordinator: NSResponder {
		var parent: RatingControl
		
		init(_ parent: RatingControl) {
			self.parent = parent
			
			super.init()
		}
		
		required init?(coder: NSCoder) {
			fatalError("Not supported")
		}
		
		@objc func valueChanged(_ sender: NSLevelIndicator) {
			parent.value = sender.doubleValue
		}
	}
}
