//
//  HSlider+Modifiers.swift
//  NSAlchemy
//
//  Created by Joshua Root on 9/21/24.
//

import SwiftUI

extension HSlider {
    /// A modifier that specifies how many tick marks the slider should have
    /// - Parameters:
    ///   - number: The number of tick marks
    ///   - stepByTicks: whether or not the thumb of the slider should only be allowed to move between the tick marks.
    ///   - position: Where the tick marks should be positioned along the slider
    /// - Returns: The modified slider
    public func tickMarks(number: Int, stepByTicks: Bool, position: NSSlider.TickMarkPosition) -> HSlider {
        var slider = self
        slider.numberOfTickMarks = number
        slider.allowsTickMarkValuesOnly = stepByTicks
        slider.tickMarkPosition = position
        
        return slider
    }
    
    /// A modifier to change the color of the slider's track.
    /// - Parameter color: The color of the track
    /// - Returns: The modified slider
    public func trackColor(_ color: NSColor) -> HSlider {
        var slider = self
        slider.trackColor = color
    
        return slider
    }
	
	public func valueChangeBehavior(_ behavior: SliderValueBehavior) -> HSlider {
		var slider = self
		slider.valueChangeBehavior = behavior
		
		return slider
	}
}
