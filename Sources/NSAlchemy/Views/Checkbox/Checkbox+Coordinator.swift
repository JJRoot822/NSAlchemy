//
//  Checkbox+Coordinator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 6/4/25.
//

import Cocoa

@available(macOS 10.15, *)
public extension Checkbox {
	class Coordinator: NSResponder {
		var parent: Checkbox
		
		init(_ parent: Checkbox) {
			self.parent = parent
		
			super.init()
		}
		
		required init?(coder: NSCoder) {
			fatalError("Not supported")
		}
		
		@objc func valueChanged(_ sender: NSButton) {
			switch sender.state {
			case .on:
				parent.state = .on
			case .off:
				parent.state = .off
			case .mixed:
				parent.state = .mixed
			default:
				parent.state = .on
			}
		}
	}
}
