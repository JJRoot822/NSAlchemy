//
//  HSlider+Modifiers.swift
//  NSAlchemy
//
//  Created by Joshua Root on 9/21/24.
//

import SwiftUI

extension HSlider {
    func tickMarks(number: Int, stepByTicks: Bool, position: NSSlider.TickMarkPosition) -> HSlider {
        var slider = self
        slider.numberOfTickMarks = number
        slider.allowsTickMarkValuesOnly = stepByTicks
        slider.tickMarkPosition = position
        
        return slider
    }
    
    func trackColor(_ color: NSColor) -> HSlider {
        var slider = self
        slider.trackColor = color
    
        return slider
    }
}
