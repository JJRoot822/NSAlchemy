//
//  LevelIndicator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 11/22/24.
//

import SwiftUI

/// A view that displays capacity, relevance, and rating levels
@available(macOS 10.15, *)
public struct LevelIndicator: NSViewRepresentable {
    var label: String
    var value: Double
    var minValue: Double
    var maxValue: Double

    var warningValue: Double?
    var criticalValue: Double?

    var tickMarkPosition: NSSlider.TickMarkPosition?
    var numberOfTickMarks: Int?
    var numberOfMajorTickMarks: Int?

    var style: NSLevelIndicator.Style

    var drawsTieredCapacityLevels: Bool?

    var fillColor: Color?
    var warningFillColor: Color?
    var criticalFillColor: Color?

    var ratingImage: NSImage?
    var ratingPlaceholderImage: NSImage?
    var placeholderVisibility: NSLevelIndicator.PlaceholderVisibility?
    
    /// Creates a new LevelIndicator with a continuous capacity style
    /// - Parameters:
    ///   - label: The label to use for assistive technologies
    ///   - value: The value of the LevelIndicator
    ///   - minValue: The minimum value for the LevelIndicator. Default is 0.
    ///   - maxValue: The maximum value of the LevelIndicator. Default is 1
    public init(_ label: String, value: Double, minValue: Double = 0, maxValue: Double = 1) {
        self.label = label
        self.value = value
        self.minValue = minValue
        self.maxValue = maxValue
        self.style = .continuousCapacity
    }
    
    /// Creates a new LevelIndicator with the rating style, and custom images for the rating and rating placeholders.
    /// - Parameters:
    ///   - label: The label to use for the LevelIndicator with assistive technologies
    ///   - value: The value for the LevelIndicator
    ///   - minValue: The minimum value of the LevelIndicator. Default is 0.
    ///   - maxValue: The maximum value for the LevelIndicator. Default is 5.
    ///   - ratingImageName: The name of the custom image to use to represent the value of the indicator
    ///   - ratingPlaceholderImageName: The name of the custom image to use for the rating placeholder
    ///   - placeholderVisibility: The visibility of the placeholder images
    public init(_ label: String, value: Double, minValue: Double = 0, maxValue: Double = 5, ratingImageName: String, ratingPlaceholderImageName: String, placeholderVisibility: NSLevelIndicator.PlaceholderVisibility) {
        self.label = label
        self.value = value
        self.minValue = minValue
        self.maxValue = maxValue
        self.style = .rating
        self.placeholderVisibility = placeholderVisibility
        self.ratingImage = NSImage(imageLiteralResourceName: ratingImageName)
        self.ratingPlaceholderImage = NSImage(imageLiteralResourceName: ratingPlaceholderImageName)
    }
    
    /// Creates a new LevelIndicator with the rating style, and system defined SF Symbols for the rating and rating placeholders.
    /// /// - Parameters:
    ///   - label: The label for the level indicator
    ///   - value: The value of the indicator
    ///   - minValue: The minimum value of the indicator
    ///   - maxValue: The maximum value of the indicator
    ///   - ratingImageSymbol: an SF Symbol to use for the rating image
    ///   - ratingPlaceholderImageSymbol: An SF Symbol to use for the rating image
    ///   - placeholderVisibility: The visibility of the placeholder image
    public init(_ label: String, value: Double, minValue: Double = 0,
         maxValue: Double = 5, ratingImageSymbol: String, ratingPlaceholderImageSymbol: String, placeholderVisibility: NSLevelIndicator.PlaceholderVisibility) {
        self.label = label
        self.value = value
        self.minValue = minValue
        self.maxValue = maxValue
        self.style = .rating
        self.placeholderVisibility = placeholderVisibility
        self.ratingImage = NSImage(systemSymbolName: ratingImageSymbol, accessibilityDescription: nil)
        self.ratingPlaceholderImage = NSImage(systemSymbolName: ratingPlaceholderImageSymbol, accessibilityDescription: nil)
    }
    
    func makeNSView(context: Context) -> NSLevelIndicator {
        let indicator = NSLevelIndicator()
        indicator.doubleValue = value
        indicator.maxValue = maxValue
        indicator.minValue = minValue
        indicator.ratingImage = self.ratingImage
        indicator.ratingPlaceholderImage = self.ratingPlaceholderImage
        indicator.isEditable = false
        indicator.setAccessibilityLabel(label)
        
        if let visibility = placeholderVisibility {
            indicator.placeholderVisibility = visibility
        }

        indicator.setAccessibilityLabel(label)

        return indicator
    }

    func updateNSView(_ nsView: NSLevelIndicator, context: Context) {
        nsView.doubleValue = self.value
        nsView.maxValue = self.maxValue
        nsView.minValue = self.minValue
        nsView.setAccessibilityLabel(label)
        nsView.ratingImage = ratingImage
        nsView.ratingPlaceholderImage = ratingPlaceholderImage
        nsView.levelIndicatorStyle = style
        
        if let fillColor = fillColor {
            nsView.fillColor = Color.nsColor(from: fillColor)
        }

        if let criticalColor = criticalFillColor {
            nsView.criticalFillColor = Color.nsColor(from: criticalColor)
        }

        if let warningColor = warningFillColor {
            nsView.warningFillColor = Color.nsColor(from: warningColor)
        }

        if let warningValue = warningValue {
            nsView.warningValue = warningValue
        }

        if let criticalValue = criticalValue {
            nsView.criticalValue = criticalValue
        }

        if let tickPosition = tickMarkPosition {
            nsView.tickMarkPosition = tickPosition
        }

        if let numberOfTicks = numberOfTickMarks {
            nsView.numberOfTickMarks = numberOfTicks
        }

        if let majorTicks = numberOfMajorTickMarks {
            nsView.numberOfMajorTickMarks = majorTicks
        }

        if let drawsTieredLevels = drawsTieredCapacityLevels {
            nsView.drawsTieredCapacityLevels = drawsTieredLevels
        }

        if let visibility = placeholderVisibility {
            nsView.placeholderVisibility = visibility
        }
    }
}
