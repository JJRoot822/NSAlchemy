//
//  CircularSlider+Coordinator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 11/7/24.
//

import AppKit

extension CircularSlider {
    class Coordinator: NSResponder {
        var parent: CircularSlider
        
        init(_ parent: CircularSlider) {
            self.parent = parent
            
            super.init()
        }
        
        required init(coder: NSCoder) {
            fatalError("Not supported.")
        }
        
        @objc func valueChanged(_ slider: NSSlider) {
            parent.value = slider.doubleValue
        }
    }
}
