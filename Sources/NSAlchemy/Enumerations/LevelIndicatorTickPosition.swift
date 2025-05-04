//
//  LevelIndicatorTickPosition.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/3/25.
//

import Cocoa

/// Constants defining the position of tick marks for a LevelIndicator
@available(macOS 11.0, *)
public enum LevelIndicatorTickPosition {
	case above, below
	
	var cocoaTickMarkPosition: NSSlider.TickMarkPosition {
		switch self {
		case .above:
			return .above
		case .below:
			return .below
		}
	}
}
