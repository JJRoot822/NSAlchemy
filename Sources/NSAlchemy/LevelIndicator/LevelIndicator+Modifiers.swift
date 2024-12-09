//
//  LevelIndicator+Modifiers.swift
//  NSAlchemy
//
//  Created by Joshua Root on 11/24/24.
//

import SwiftUI

extension LevelIndicator {
    /// A modifier used to define the fill color of the indicator when it's value is below the warning and critical levels.
    /// - Parameter color: The color to use as the fill color
    /// - Returns: The modified LevelIndicator
    func indicatorFill(color: Color) -> LevelIndicator {
        var indicator = self
        indicator.fillColor = color
        
        return indicator
    }
    
    /// A modifier for specifying the indicator's warning value, and what color to use for the indicator's fill color when that value is reached.
    /// - Parameters:
    ///   - value: The warning value for the indicator
    ///   - color: The color to use as the indicator's fill color when the warning value is reached
    /// - Returns: The modified LevelIndicator``
    func indicatorWarning(value: Double, color: Color) -> LevelIndicator {
        var indicator = self
        indicator.warningValue = value
        indicator.warningFillColor = warningFillColor
    
        return indicator
    }
    
    /// A modifier to specify the indicator's warning value using a fraction of it's maximum value, and what color should be used as the fill color of the indicator when the warning value is reached
    /// - Parameters:
    ///   - fraction: How much of the maximum value should be reached before the fill color changes to it's warning color
    ///   - color: The color to use as the indicator's warning fill color
    /// - Returns: The modified LevelIndicator
    func indicatorWarning(fraction: Double, color: Color) -> LevelIndicator {
        var indicator = self
        indicator.warningValue = indicator.maxValue * fraction
        indicator.warningFillColor = warningFillColor
    
        return indicator
    }
    
    /// A modifier for specifying the indicators critical value and the color to use as it's critical fill color
    /// - Parameters:
    ///   - value: THe indicator's critical value
    ///   - color: The indicator's critical color
    /// - Returns: THe modified LevelIndicator
    func indicatorCritical(value: Double, color: Color) -> LevelIndicator {
        var indicator = self
        indicator.criticalValue = value
        indicator.criticalFillColor = color
    
        return indicator
    }
    
    /// A modifier to specify the indicator's critical value using a fraction of the maximum value, and the color to use as the indicator's critical fill color
    /// - Parameters:
    ///   - fraction: How much of the maximum value must be reached before triggering a change to the critical fill color as the indicator's fill color.
    ///   - color: The critical fill color of the indicator
    /// - Returns: The modified LevelIndicator
    func indicatorCritical(fraction: Double, color: Color) -> LevelIndicator {
        var indicator = self
        indicator.criticalValue = indicator.maxValue * fraction
        indicator.criticalFillColor = color
        
        return indicator
    }
    
    /// A modifier to define how many normal and major tick marks should be displayed, and where they should be positioned along the indicator.
    /// - Parameters:
    ///   - ticks: The number of tick marks
    ///   - majorTicks: The number of major tick marks
    ///   - position: The position of the tick marks
    /// - Returns: The modified LevelIndicator
    func tickMarks(_ ticks: Int, majorTicks: Int, position: NSSlider.TickMarkPosition) -> LevelIndicator {
        var indicator = self
        indicator.numberOfTickMarks = ticks
        indicator.numberOfMajorTickMarks = majorTicks
        indicator.tickMarkPosition = position
    
        return indicator
    }
    
    /// A modifier to specify the number of tick marks should be displayed, and where they should be positioned along the indicator
    /// - Parameters:
    ///   - ticks: The number of tick marks
    ///   - position: The position of the tick marks
    /// - Returns: The modified LevelIndicator
    func tickMarks(_ ticks: Int, position: NSSlider.TickMarkPosition) -> LevelIndicator {
        var indicator = self
        indicator.numberOfTickMarks = ticks
        indicator.tickMarkPosition = position
    
        return indicator
    }
    
    /// A modifier for specifying the style of the level indicator
    /// - Parameter style: The style of the indicator
    /// - Returns: The modified LevelIndicator
    func indicatorStyle(_ style: NSLevelIndicator.Style) -> LevelIndicator {
        var indicator = self
        indicator.style = style
        
        return indicator
    }
    
    /// A modifier to specify whether or not to draw tiered capacity levels
    /// - Returns: The modified Level Indicator
    func tierdCapacityLevels() -> LevelIndicator {
        var indicator = self
        indicator.drawsTieredCapacityLevels = true
        
        return indicator
    }
}
