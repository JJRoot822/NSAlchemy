//
//  SegmentedControl+Modifiers.swift
//  NSAlchemy
//
//  Created by Joshua Root on 2/3/25.
//

import SwiftUI

@available(macOS 11.0, *)
public extension SegmentedControl {
	/// A modifier that sets the color for the selected segments to use for their tint color
	/// - Parameter color: The color to use for the selected segments
	/// - Returns: The modified SegmentedControl
	func selectedSegmentColor(_ color: Color) -> SegmentedControl {
        var control = self
        control.selectedSegmentTintColor = color
        
        return control
    }
	
	/// A modifier to set the tint color to use for the selected segments.
	/// - Parameter color: The color to use as the selected segments' tint color
	/// - Returns: The modified SegmentedControl
    @available(macOS 12.0, *)
    func selectedSegmentColor(_ color: NSColor) -> SegmentedControl {
        var control = self
        control.selectedSegmentTintColor = Color(nsColor: color)
        
        return control
    }
	
	/// A modifier that sets the distribution for the SegmentedControl
	/// - Parameter distribution: The SegmentedControl's distribution
	/// - Returns: The modified SegmentedControl
    func segmentDistribution(_ distribution: SegmentedControlDistributionStyle) -> SegmentedControl {
        var control = self
        control.distributionStyle = distribution
        
        return control
    }
	
	/// A modifier to set the style of the SegmentedControl
	/// - Parameter style: The style of the SegmentedControl
	/// - Returns: The modified SegmentedControl
    func segmentedControlStyle(_ style: SegmentedControlStyle) -> SegmentedControl {
        var control = self
        control.segmentedControlStyle = style
        
        return control
    }
}
