//
//  CircularSlider.swift
//  NSAlchemy
//
//  Created by Joshua Root on 11/7/24.
//

import SwiftUI

/// A type of slider that represents an adjustable knob
@available(macOS 10.15, *)
public struct CircularSlider: NSViewRepresentable {
    @Binding var value: Double
    
    var label: String
    var min: Double = 0
    var max: Double = 1
    var altStep: Double?

    var allowsTickMarkValuesOnly: Bool = false

	var valueChangeBehavior: SliderValueBehavior
	
    /// Creates a CircularSlider with a range of values (inclusive), and optional tick marks
    /// - Parameters:
    ///   - value: A binding to the slider's value.
    ///   - label: The string to use as the slider's accessibility label.
    ///   - min: The slider's minimum value. The Default value is 0.
    ///   - max: The slider's maximum value. The default value is 1.
    ///   - altStep: The increment or decrement value when the alt key is held down when adjusting the value of the slider. The default value is nil.
    ///   - allowTickMarks: Whether or not to allow tick marks around the circumference of the slider. The default value is false.
	public init(_ label: String, value: Binding<Double>, min: Double = 0, max: Double = 1, altStep: Double? = nil, allowTickMarks: Bool = false) {
		self._value = value
		self.label = label
		self.min = min
		self.max = max
		self.altStep = altStep
		self.valueChangeBehavior = .continuous
	}
    
    public func makeNSView(context: Context) -> NSSlider {
        let slider = NSSlider()
        slider.target = context.coordinator
        slider.action = #selector(context.coordinator.valueChanged)
        slider.sliderType = .circular
        slider.setAccessibilityLabel(label)
        slider.doubleValue = value
        slider.minValue = min
        slider.maxValue = max
        slider.allowsTickMarkValuesOnly = allowsTickMarkValuesOnly
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
		nsView.allowsTickMarkValuesOnly = allowsTickMarkValuesOnly
		
		switch valueChangeBehavior {
		case .continuous:
			nsView.isContinuous = true
		case .doneAdjusting:
			nsView.isContinuous = false
		}
	}
}

