//
//  HSlider+Coordinator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 9/21/24.
//

import SwiftUI

extension HSlider {
    class Coordinator: NSResponder {
        var parent: HSlider
        
        init(_ parent: HSlider) {
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
