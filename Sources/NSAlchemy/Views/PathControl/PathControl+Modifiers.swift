//
//  PathControl+Modifiers.swift
//  NSAlchemy
//
//  Created by Joshua Root on 4/25/25.
//

import Foundation

@available(macOS 10.15, *)
public extension PathControl {
	/// A modifier to specify what should happen when the user single clicks on a path item in the control
	/// - Parameter action: The action to be executed when a path item is single clicked
	/// - Returns: The modified PathControl
	func onComponentSingleClick(action: @escaping (URL?) -> Void) -> PathControl {
		var pathControl = self
		pathControl.singleClickAction = action
		
		return pathControl
	}
	
	/// A modifier to specify what should happen when the user double clicks on a path item in the control
	/// - Parameter action: The action to execute when a path item is double clicked
	/// - Returns: The modified PathControl
	func onComponentDoubleClick(action: @escaping (URL?) -> Void) -> PathControl {
		var pathControl = self
		pathControl.doubleClickAction = action
		
		return pathControl
	}
}
