//
//  FlexibleButtonImagePosition.swift
//  NSAlchemy
//
//  Created by Joshua Root on 6/1/25.
//

import Cocoa

@available(macOS 11.0, *)
public enum FlexibleButtonImagePosition {
	case top, bottom, leading, trailing, left, right, overlap
	
	var cocoaPosition: NSControl.ImagePosition {
		switch self {
		case .top: .imageAbove
		case .bottom: .imageBelow
		case .leading: .imageLeading
		case .trailing: .imageTrailing
		case .left: .imageLeft
		case .right: .imageRight
		case .overlap: .imageOverlaps
		}
	}
}
