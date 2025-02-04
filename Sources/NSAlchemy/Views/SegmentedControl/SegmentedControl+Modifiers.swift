//
//  SegmentedControl+Modifiers.swift
//  NSAlchemy
//
//  Created by Joshua Root on 2/3/25.
//

import SwiftUI

@available(macOS 11.0, *)
public extension SegmentedControl {
    func selectedSegmentColor(_ color: Color) -> SegmentedControl {
        var control = self
        control.selectedSegmentTintColor = color
        
        return control
    }
    
    @available(macOS 12.0, *)
    func selectedSegmentColor(_ color: NSColor) -> SegmentedControl {
        var control = self
        control.selectedSegmentTintColor = Color(nsColor: color)
        
        return control
    }
    
    func segmentDistribution(_ distribution: SegmentedControlDistributionStyle) -> SegmentedControl {
        var control = self
        control.distributionStyle = distribution
        
        return control
    }
    
    func segmentedControlStyle(_ style: SegmentedControlStyle) -> SegmentedControl {
        var control = self
        control.segmentedControlStyle = style
        
        return control
    }
}
