//
//  ComboBox+Coordinator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 12/12/24.
//

import Cocoa

@available(macOS 10.15, *)
extension ComboBox {
    public class Coordinator: NSResponder {
        private var parent: ComboBox
        
        init(_ parent: ComboBox) {
            self.parent = parent
        
            super.init()
        }
        
        required init?(coder: NSCoder) {
            fatalError("Not supported")
        }
        
        @objc func valueChanged(_ sender: NSComboBox) {
            if let selectedItem = sender.objectValueOfSelectedItem as? String {
                parent.selection = selectedItem
            }
        }
    }
}
