//
//  SegmentedControlStyle.swift
//  NSAlchemy
//
//  Created by Joshua Root on 2/3/25.
//

import SwiftUI

/// Constants for specifying the style to use for a SegmentedControl
@available(macOS 10.15, *)
public enum SegmentedControlStyle {
    case automatic, rounded, roundedRect, texturedSquare, smallSquare, separated

    static func cocoaStyle(for style: SegmentedControlStyle) -> NSSegmentedControl.Style {
        switch style {
        case .automatic:
            return .automatic
        case .rounded:
            return .rounded
        case .roundedRect:
            return .roundRect
        case .separated:
            return .separated
        case .smallSquare:
            return .smallSquare
        case .texturedSquare:
            return .texturedSquare
        }
    }
}
