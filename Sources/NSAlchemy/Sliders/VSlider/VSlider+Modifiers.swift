//
//  VSlider+Modifiers.swift
//  NSAlchemy
//
//  Created by Joshua Root on 9/21/24.
//

import SwiftUI

extension VSlider {
    /// A modifier for specifying the number of tick marks that the slider should have.
    /// - Parameters:
    ///   - number: The number of tick marks
    ///   - stepByTicks: Whether or not the slider's thumb should only be moved between tick marks.
    ///   - position: Where the tick marks should be positioned along the slider
    /// - Returns: The modified slider.
    func tickMarks(number: Int, stepByTicks: Bool, position: NSSlider.TickMarkPosition) -> VSlider {
        var slider = self
        slider.numberOfTickMarks = number
        slider.allowsTickMarkValuesOnly = stepByTicks
        slider.tickMarkPosition = position
        
        return slider
    }
    
    /// A modifier for specifying the color of the slider's track
    /// - Parameter color: The color of the track
    /// - Returns: The modified slider
    func trackColor(_ color: NSColor) -> VSlider {
        var slider = self
        slider.trackColor = color
    
        return slider
    }
}
