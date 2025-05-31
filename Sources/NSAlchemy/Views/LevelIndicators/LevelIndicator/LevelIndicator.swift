//
//  LevelIndicator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 11/22/24.
//

import SwiftUI

/// A view that displays capacity levels
@available(macOS 11.0, *)
public struct LevelIndicator: NSViewRepresentable {
    var label: String
    var value: Double
    var minValue: Double
    var maxValue: Double

    var warningValue: Double?
    var criticalValue: Double?

    var tickMarkPosition: LevelIndicatorTickPosition?
    var numberOfTickMarks: Int?
    var numberOfMajorTickMarks: Int?

    var style: LevelIndicatorStyle

    var drawsTieredCapacityLevels: Bool?

    var fillColor: Color?
    var warningFillColor: Color?
    var criticalFillColor: Color?

    /// Creates a new LevelIndicator with a continuous capacity style
    /// - Parameters:
    ///   - label: The label to use for assistive technologies
    ///   - value: The value of the LevelIndicator
    ///   - minValue: The minimum value for the LevelIndicator. Default is 0.
    ///   - maxValue: The maximum value of the LevelIndicator. Default is 1
    @available(macOS 11.0, *)
    public init(_ label: String, value: Double, minValue: Double = 0, maxValue: Double = 1) {
        self.label = label
        self.value = value
        self.minValue = minValue
        self.maxValue = maxValue
		self.style = .continuous
    }
    
    @available(macOS 11.0, *)
    public func makeNSView(context: Context) -> NSLevelIndicator {
        let indicator = NSLevelIndicator()
        indicator.doubleValue = value
        indicator.maxValue = maxValue
        indicator.minValue = minValue
        indicator.isEditable = false
        indicator.setAccessibilityLabel(label)
        
		return indicator
    }

    @available(macOS 11.0, *)
    public func updateNSView(_ nsView: NSLevelIndicator, context: Context) {
        nsView.doubleValue = self.value
        nsView.maxValue = self.maxValue
        nsView.minValue = self.minValue
        nsView.setAccessibilityLabel(label)
		nsView.levelIndicatorStyle = style.cocoaLevelIndicatorStyle
        
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
			nsView.tickMarkPosition = tickPosition.cocoaTickMarkPosition
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
    }
}
