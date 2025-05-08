//
//  SearchField+Coordinator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 1/30/25.
//

import SwiftUI

extension SearchField {
    public class Coordinator: NSResponder, NSSearchFieldDelegate {
        var parent: SearchField
        
        init(_ parent: SearchField) {
            self.parent = parent
        
            super.init()
        }
        
        required init?(coder: NSCoder) {
            fatalError("Not supported")
        }
        
//		public func control(_ control: NSControl, textView: NSTextView, completions words: [String], forPartialWordRange charRange: NSRange, indexOfSelectedItem index: UnsafeMutablePointer<Int>) -> [String] {
//			let partial = (textView.string as NSString).substring(with: charRange).lowercased()
//			let matches = parent.completions!.filter { $0.lowercased().hasPrefix(partial) }
//			
//			return matches
//		}
		
        @objc func search(_ sender: NSSearchField) {
            parent.text = sender.stringValue
        }
    }
}
