//
//  ContinuousButton+Coordinator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 1/28/25.
//

import AppKit

extension ContinuousButton {
    public class Coordinator: NSResponder {
        var parent: ContinuousButton
        
        init(_ parent: ContinuousButton) {
            self.parent = parent
            
            super.init()
        }
        
        required init?(coder: NSCoder) {
            fatalError("Not supported")
        }
        
        @objc func buttonClicked() {
            parent.action()
        }
    }
}
