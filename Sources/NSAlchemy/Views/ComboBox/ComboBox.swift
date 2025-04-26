//
//  ComboBox.swift
//  NSAlchemy
//
//  Created by Joshua Root on 12/11/24.
//

import SwiftUI

/// A view that combines a text field and a popup menu.
@available(macOS 10.15, *)
public struct ComboBox: NSViewRepresentable {
    @Binding var selection: String
    
    var label: String
    var hasVerticalScroller: Bool
    var itemSpacing: NSSize?
    var itemHeight: CGFloat?
    var visibleItemsCount: Int?
    var completes: Bool
    var items: [String]
    
    
    /// Creates a new ComboBox
    /// - Parameters:
    ///   - label: The string to be used as the ComboBox's accessibility label.
    ///   - selection: A string binding to the selected value of the ComboBox.
    ///   - hasScroller: Whether or not the popup menu of the ComboBox has a vertical scroller.
    ///   - completes: Whether or not the ComboBox attempts to complete the value as the user types with the closest matching item.
    ///   - items: The items, as strings, that the ComboBox should display as options.
    public init(_ label: String, selection: Binding<String>, hasScroller: Bool, completes: Bool, items: [String]) {
        self.label = label
        self.hasVerticalScroller = hasScroller
        self._selection = selection
        self.completes = completes
        self.items = items
    }
    
    public func makeNSView(context: Context) -> NSComboBox {
        let comboBox = NSComboBox()
        comboBox.setAccessibilityLabel(label)
        comboBox.completes = completes
        comboBox.hasVerticalScroller = hasVerticalScroller
        comboBox.usesDataSource = false
        comboBox.addItems(withObjectValues: items)
        comboBox.selectItem(withObjectValue: selection)
        comboBox.isEditable = true
        comboBox.action = #selector(context.coordinator.valueChanged)
        comboBox.target = context.coordinator
        
        return comboBox
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    public func updateNSView(_ nsView: NSComboBox, context: Context) {
        if let intercellSpacing = itemSpacing {
            nsView.intercellSpacing = intercellSpacing
        }
        
        if let visibleItemsCount = visibleItemsCount {
            nsView.numberOfVisibleItems = visibleItemsCount
        }
        
        if let itemHeight = itemHeight {
            nsView.itemHeight = itemHeight
        }
    }
}
