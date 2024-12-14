//
//  PathControl+Coordinator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 12/11/24.
//

import AppKit

@available(macOS 10.15, *)
extension PathControl {
    public class Coordinator: NSResponder {
        private var parent: PathControl
        
        public init(_ parent: PathControl) {
            self.parent = parent
        
            super.init()
        }
        
        required init?(coder: NSCoder) {
            fatalError("Not Supported")
        }
        
        @objc func doubleClicked() {
            guard let doubleClickAction = parent.doubleClickAction else { return }
            
            doubleClickAction()
        }
    }
}


