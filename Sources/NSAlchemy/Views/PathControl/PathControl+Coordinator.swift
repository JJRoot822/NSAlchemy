//
//  PathControl+Coordinator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 4/25/25.
//

import AppKit

@available(macOS 10.15, *)
public extension PathControl {
	class Coordinator: NSResponder {
		var parent: PathControl
		
		init(_ parent: PathControl) {
			self.parent = parent
		
			super.init()
		}
		
		required init?(coder: NSCoder) {
			fatalError("Not supported")
		}
		
		@objc func componentSingleClicked(_ sender: NSPathControl) {
			if let clickedItem = sender.clickedPathItem,
			   let action = parent.singleClickAction {
				action(clickedItem.url)
			}
		}
		
		@objc func componentDoubleClicked(_ sender: NSPathControl) {
			if let clickedItem = sender.clickedPathItem,
			   let action = parent.doubleClickAction {
				action(clickedItem.url)
			}
		}
	}
}
