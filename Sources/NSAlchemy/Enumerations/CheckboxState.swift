//
//  CheckboxState.swift
//  NSAlchemy
//
//  Created by Joshua Root on 1/30/25.
//

import AppKit

/// Constants that define the various states of a checkbox
public enum CheckboxState {
    case on, off, mixed
    
    static func cocoaState(for state: CheckboxState) -> NSButton.StateValue {
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
