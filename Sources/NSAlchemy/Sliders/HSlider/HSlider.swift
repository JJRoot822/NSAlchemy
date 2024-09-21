//
//  HSlider.swift
//  NSAlchemy
//
//  Created by Joshua Root on 9/21/24.
//

import SwiftUI

struct HSlider: NSViewRepresentable {
    @Binding var value: Double
    
    var label: String
    var min: Double = 0
    var max: Double = 1
    var altStep: Double?

    var trackColor: NSColor?
    var numberOfTickMarks: Int = 0
    var allowsTickMarkValuesOnly: Bool = false
    var tickMarkPosition: NSSlider.TickMarkPosition = .leading
    
    init(value: Binding<Double>, label: String, min: Double = 0, max: Double = 1, altStep: Double? = nil) {
        self._value = value
        self.label = label
        self.min = min
        self.max = max
        self.altStep = altStep
    }
    
    
    func makeNSView(context: Context) -> NSSlider {
        var slider = NSSlider()
        slider.target = context.coordinator
        slider.action = #selector(context.coordinator.valueChanged)
        slider.sliderType = .linear
        slider.isVertical = false
        slider.setAccessibilityLabel(label)
        slider.doubleValue = value
        slider.minValue = min
        slider.maxValue = max
        slider.allowsTickMarkValuesOnly = allowsTickMarkValuesOnly
        slider.numberOfTickMarks = numberOfTickMarks
        slider.trackFillColor = trackColor
        
        if let altStep = altStep {
            slider.altIncrementValue = altStep
        }
        
        return slider
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func updateNSView(_ nsView: NSSlider, context: Context) {
        nsView.doubleValue = value
        nsView.trackFillColor = trackColor
        nsView.allowsTickMarkValuesOnly = allowsTickMarkValuesOnly
        nsView.numberOfTickMarks = numberOfTickMarks
        nsView.tickMarkPosition = tickMarkPosition
    }
    
    
}

