//
//  VSlider+Coordinator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 9/21/24.
//

import SwiftUI

extension VSlider {
    public class Coordinator: NSResponder {
        var parent: VSlider
        
        public init(_ parent: VSlider) {
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

