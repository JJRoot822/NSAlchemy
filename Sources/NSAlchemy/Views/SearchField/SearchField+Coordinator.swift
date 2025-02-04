//
//  SearchField+Coordinator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 1/30/25.
//

import SwiftUI

extension SearchField {
    public class Coordinator: NSResponder {
        var parent: SearchField
        
        init(_ parent: SearchField) {
            self.parent = parent
        
            super.init()
        }
        
        required init?(coder: NSCoder) {
            fatalError("Not supported")
        }
        
        @objc func search(_ sender: NSSearchField) {
            parent.text = sender.stringValue
        }
    }
}
