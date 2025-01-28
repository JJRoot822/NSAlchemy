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
    
    /// Constants that define the various states of a checkbox
    public enum State {
        case on, off, mixed
        
        static func cocoaState(for state: Checkbox.State) -> NSButton.StateValue {
            switch state {
            case .on:
                return .on
            case .mixed:
                return .mixed
            case .off:
                return .off
            }
        }
    }
    
    @Binding var state: Checkbox.State
    
    var title: String
    var textColor: NSColor
    var tintColor: NSColor
    var allowsMixedState: Bool
    
    /// Creates a Checkbox view
    /// - Parameters:
    ///   - title: The label text of the checkbox
    ///   - state: The checkbox's state
    ///   - allowsMixed: Whether or not the checkbox should support a mixed state
    public init(_ title: String, state: Binding<Checkbox.State>, allowsMixed: Bool = true) {
        self._state = state
        self.title = title
        self.textColor = .labelColor
        self.tintColor = .controlAccentColor
        self.allowsMixedState = true
    }
    
    public func makeNSView(context: Context) -> NSButton {
        let checkbox = NSButton(checkboxWithTitle: self.title, target: nil, action: nil)
        checkbox.state = State.cocoaState(for: self.state)
        checkbox.allowsMixedState = allowsMixedState
        checkbox.bezelColor = tintColor
        checkbox.contentTintColor = textColor
        
        return checkbox
    }
    
    public func updateNSView(_ nsView: NSButton, context: Context) {
        nsView.state = State.cocoaState(for: state)
        nsView.bezelColor = tintColor
        nsView.contentTintColor = textColor
        
    }
    
    
}
