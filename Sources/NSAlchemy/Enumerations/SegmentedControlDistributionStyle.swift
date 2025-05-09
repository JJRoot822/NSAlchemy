//
//  SegmentedControlDistributionStyle.swift
//  NSAlchemy
//
//  Created by Joshua Root on 2/3/25.
//

import SwiftUI


/// Constants to specify how segments in a SegmentedControl are distributed along the width of the SegmentedControl
@available(macOS 10.15, *)
public enum SegmentedControlDistributionStyle {
    case fit, fill, fillEqually, fillProportionally
    
    static func cocoaDistribution(for distribution: SegmentedControlDistributionStyle) -> NSSegmentedControl.Distribution {
        switch distribution {
        case .fit:
            return .fit
        case .fill:
            return .fill
        case .fillEqually:
            return .fillEqually
        case .fillProportionally:
            return .fillProportionally
        }
    }
}
