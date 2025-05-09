//
//  CircularSlider+Modifiers.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/9/25.
//

import Foundation

extension CircularSlider {
	public func valueChangeBehavior(_ behavior: SliderValueBehavior) -> CircularSlider {
		var slider = self
		slider.valueChangeBehavior = behavior
		
		return slider
	}
}
