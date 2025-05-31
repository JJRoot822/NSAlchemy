//
//  AcceleratorButton+Coordinator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 1/28/25.
//

import AppKit

extension AcceleratorButton {
    public class Coordinator: NSResponder {
        var parent: AcceleratorButton
        
        init(_ parent: AcceleratorButton) {
            self.parent = parent
            
            super.init()
        }
        
        required init?(coder: NSCoder) {
            fatalError("Not supported")
        }
        
        @objc func buttonClicked(_ sender: NSButton) {
            parent.action(sender.doubleValue)
        }
    }
}
