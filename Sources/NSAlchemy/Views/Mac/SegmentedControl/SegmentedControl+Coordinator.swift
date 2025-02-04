//
//  SegmentedControl+Coordinator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 2/3/25.
//

import SwiftUI

@available(macOS 11.0, *)
public extension SegmentedControl {
    class Coordinator: NSResponder {
        var parent: SegmentedControl
        
        init(_ parent: SegmentedControl) {
            self.parent = parent
        
            super.init()
        }
       
        required init?(coder: NSCoder) {
            fatalError("Not supported")
        }
        
        @objc func segmentClicked(_ sender: NSSegmentedControl) {
            var selectedSegments = Set<SegmentedControlItem>()
        
            for index in 0..<sender.segmentCount {
                if sender.isSelected(forSegment: index) {
                    selectedSegments.insert(parent.items[index])
                }
                
                parent.selection = selectedSegments
            }
        }
    }
}
