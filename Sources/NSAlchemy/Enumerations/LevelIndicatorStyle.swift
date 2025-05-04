//
//  LevelIndicatorStyle.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/3/25.
//

import Cocoa

/// Constants that indicate the style of a LevelIndicator
@available(macOS 11.0, *)
public enum LevelIndicatorStyle {
	case continuous, discrete
	
	public var cocoaLevelIndicatorStyle: NSLevelIndicator.Style {
		switch self {
		case .continuous:
			return .continuousCapacity
		case .discrete:
			return .discreteCapacity
		}
	}
}


