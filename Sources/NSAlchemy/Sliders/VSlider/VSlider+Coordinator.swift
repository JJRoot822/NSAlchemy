//
//  VSlider+Coordinator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 9/21/24.
//

import SwiftUI

extension VSlider {
    class Coordinator: NSResponder {
        var parent: VSlider
        
        init(_ parent: VSlider) {
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

