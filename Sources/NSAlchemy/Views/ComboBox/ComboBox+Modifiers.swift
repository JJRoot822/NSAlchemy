//
//  ComboBox+Modifiers.swift
//  NSAlchemy
//
//  Created by Joshua Root on 12/12/24.
//

import SwiftUI

@available(macOS 10.15, *)
extension ComboBox {
    /// A modifier to define the height of each item in a ComboBox's popup menu.
    /// - Parameter height: The hight of each item in the ComboBox.
    /// - Returns: The modified ComboBox
    public func itemHeight(_ height: CGFloat) -> ComboBox {
        var comboBox = self
        comboBox.itemHeight = itemHeight
        
        return comboBox
    }
    
    /// A modifier to define the intercell spacing between each item in the ComboBox.
    /// - Parameters:
    ///   - horizontalSpacing: The amount of horizontal spacing between each item in the ComboBox.
    ///   - verticalSpacing: The amount of vertical spacing between each item in the ComboBox.
    /// - Returns: The modified ComboBox
    public func itemSpacing(horizontalSpacing: CGFloat, verticalSpacing: CGFloat) -> ComboBox {
        var comboBox = self
        comboBox.itemSpacing = NSSize(width: horizontalSpacing, height: verticalSpacing)
        
        return comboBox
    }
    
    /// A modifier to define how many items in the ComboBox should be visible at any time.
    /// - Parameter count: The number of items that should be visible.
    /// - Returns: The modified ComboBox.
    public func visibleItems(_ count: Int) -> ComboBox {
        var comboBox = self
        comboBox.visibleItemsCount = count
        
        return comboBox
    }
}
