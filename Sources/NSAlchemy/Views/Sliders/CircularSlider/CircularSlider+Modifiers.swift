//
//  CircularSlider+Modifiers.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/9/25.
//

import Foundation

extension CircularSlider {
	/// A modifier to change how a slider communicates  it's change in value
	/// - Parameter behavior: How to communicate value changes
	/// - Returns: A modified CircularSlider
	public func valueChangeBehavior(_ behavior: SliderValueBehavior) -> CircularSlider {
		var slider = self
		slider.valueChangeBehavior = behavior
		
		return slider
	}
}
