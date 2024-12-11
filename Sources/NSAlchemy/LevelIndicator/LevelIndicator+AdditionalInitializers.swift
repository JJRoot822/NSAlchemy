//
//  LevelIndicator+AdditionalInitializers.swift
//  NSAlchemy
//
//  Created by Joshua Root on 11/24/24.
//

import SwiftUI

@available(macOS 10.15, *)
extension LevelIndicator {
    /// Creates a new LevelIndicator with the rating style, a system defined SF Symbol for the rating placeholder and a custom image for the rating image.
    /// - Parameters:
    ///   - label: The label for the indicator
    ///   - value: The value for the indicator
    ///   - minValue: The minimum value for the indicator. The default value is 0.
    ///   - maxValue: The maximum value for the indicator. The default value is 5
    ///   - ratingImageName: A custom image from the asset catalog to use for the rating image
    ///   - ratingPlaceholderImageSymbol: A system defined SF Symbol to use as the rating placeholder image.
    ///   - placeholderVisibility: The visibility of the rating placeholder images.
    init(_ label: String, value: Double, minValue: Double = 0, maxValue: Double = 5, ratingImageName: String, ratingPlaceholderImageSymbol: String, placeholderVisibility: NSLevelIndicator.PlaceholderVisibility) {
        self.label = label
        self.value = value
        self.minValue = minValue
        self.maxValue = maxValue
        self.style = .rating
        self.placeholderVisibility = placeholderVisibility
        self.ratingImage = NSImage(imageLiteralResourceName: ratingImageName)
        self.ratingPlaceholderImage = NSImage(systemSymbolName: ratingPlaceholderImageSymbol, accessibilityDescription: nil)
    }
    
    /// Creates a new LevelIndicator with the rating style, a system defined SF Symbol for the rating image, and a custom image for the rating placeholders.
    /// - Parameters:
    ///   - label: The label for the indicator
    ///   - value: The value for the indicator
    ///   - minValue: The minimum value for the indicator
    ///   - maxValue: The maximum value for the indicator
    ///   - ratingImageSymbol: The system  defined SF Symbol for the rating image
    ///   - ratingPlaceholderImageName: The image from the asset catalog to use as the placeholder rating image
    ///   - placeholderVisibility: The visibility of the placeholder rating images.
    init(_ label: String, value: Double, minValue: Double = 0,maxValue: Double = 5, ratingImageSymbol: String, ratingPlaceholderImageName: String, placeholderVisibility: NSLevelIndicator.PlaceholderVisibility) {
        self.label = label
        self.value = value
        self.minValue = minValue
        self.maxValue = maxValue
        self.style = .rating
        self.placeholderVisibility = placeholderVisibility
        self.ratingImage = NSImage(systemSymbolName: ratingImageSymbol, accessibilityDescription: nil)
        self.ratingPlaceholderImage = NSImage(imageLiteralResourceName: ratingPlaceholderImageName)
    }
}

