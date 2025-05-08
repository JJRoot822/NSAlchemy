//
//  SegmentedControlSelectionMode.swift
//  NSAlchemy
//
//  Created by Joshua Root on 2/3/25.
//

import SwiftUI

/// Constants for specifying how many segments the user can select in a SegmentedControl
@available(macOS 10.15, *)
public enum SegmentedControlSelectionMode {
    case one, multiple
    
    static func cocoaMode(for mode: SegmentedControlSelectionMode) -> NSSegmentedControl.SwitchTracking {
        switch mode {
        case .one:
            return .selectOne
        case .multiple:
            return .selectAny
        }
    }
}
