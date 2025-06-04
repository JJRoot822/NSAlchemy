//
//  Checkbox.swift
//  NSAlchemy
//
//  Created by Joshua Root on 1/28/25.
//

import SwiftUI

/// A checkbox that optionally allows a mixed state, along with it's on and off states.
@available(macOS 10.15, *)
public struct Checkbox: NSViewRepresentable {
    @Binding var state: CheckboxState
    
    var title: String
    var allowsMixedState: Bool
    
    /// Creates a Checkbox view
    /// - Parameters:
    ///   - title: The label text of the checkbox
    ///   - state: The checkbox's state
    ///   - allowsMixed: Whether or not the checkbox should support a mixed state
    public init(_ title: String, state: Binding<CheckboxState>, allowsMixed: Bool = true) {
        self._state = state
        self.title = title
        self.allowsMixedState = true
    }
    
    public func makeNSView(context: Context) -> NSButton {
        let checkbox = NSButton(checkboxWithTitle: self.title, target: nil, action: nil)
		checkbox.state = state.cocoaRepresentation
        checkbox.allowsMixedState = allowsMixedState
		checkbox.target = context.coordinator
		checkbox.action = #selector(context.coordinator.valueChanged)
		
        return checkbox
    }
    
	public func updateNSView(_ nsView: NSButton, context: Context) {
		nsView.state = state.cocoaRepresentation
	}
	
	public func makeCoordinator() -> Coordinator {
		return Coordinator(self)
	}
    
    
}
