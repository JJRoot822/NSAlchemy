//
//  HSlider.swift
//  NSAlchemy
//
//  Created by Joshua Root on 9/21/24.
//

import SwiftUI

/// A horizontal slider
@available(macOS 10.15, *)
public struct HSlider: NSViewRepresentable {
    @Binding var value: Double
    
    var label: String
    var min: Double = 0
    var max: Double = 1
    var altStep: Double?

    var trackColor: NSColor?
    var numberOfTickMarks: Int = 0
    var allowsTickMarkValuesOnly: Bool = false
    var tickMarkPosition: NSSlider.TickMarkPosition = .leading

	var valueChangeBehavior: SliderValueBehavior
	
    /// Creates a new HSlider with a range of values (inclusive) and optional tick marks.
    /// - Parameters:
    ///   - value: A binding to the value of the slider
    ///   - label: The string to be used as the slider's accessibility label
    ///   - min: The slider's minimum value. The default value is 0.
    ///   - max: The slider's maximum value. The default value is 1.
    ///   - altStep: The increment or decrement value when the alt key is held down while adjusting the slider's value. The default value is nil.
    ///   - allowsTickMarks: Whether or not to show tick marks. The default value = false.
	public init(_ label: String, value: Binding<Double>, min: Double = 0, max: Double = 1, altStep: Double? = nil, allowsTickMarks: Bool = false) {
		self._value = value
		self.label = label
		self.min = min
		self.max = max
		self.altStep = altStep
		self.allowsTickMarkValuesOnly = allowsTickMarks
		self.valueChangeBehavior = .continuous
	}
    
    public func makeNSView(context: Context) -> NSSlider {
        let slider = NSSlider()
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
		slider.isContinuous = true
		
        if let altStep = altStep {
            slider.altIncrementValue = altStep
        }
        
        return slider
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
	public func updateNSView(_ nsView: NSSlider, context: Context) {
		nsView.doubleValue = value
		nsView.trackFillColor = trackColor
		nsView.allowsTickMarkValuesOnly = allowsTickMarkValuesOnly
		nsView.numberOfTickMarks = numberOfTickMarks
		nsView.tickMarkPosition = tickMarkPosition
		
		switch valueChangeBehavior {
		case .continuous:
			nsView.isContinuous = true
		case .doneAdjusting:
			nsView.isContinuous = false
		}
	}
    
    
}

