//
//  Checkbox+Modifiers.swift
//  NSAlchemy
//
//  Created by Joshua Root on 1/28/25.
//

import SwiftUI

public extension Checkbox {
    /// A modifier to specify the color of the checkbox
    /// - Parameter color: The color of the checkbox
    /// - Returns: The modified Checkbox
    @available(macOS 11.0, *)
    func tintColor(_ color: Color) -> Checkbox {
        var checkbox = self
        checkbox.tintColor = NSColor(color)
        
        return checkbox
    }
    
    /// A modifier to specify the color of the checkbox
    /// - Parameter color: The color of the checkbox
    /// - Returns: The modified Checkbox
    @available(macOS 10.15, *)
    func tintColor(_ color: NSColor) -> Checkbox {
        var checkbox = self
        checkbox.tintColor = color
        
        return checkbox
    }
    
    /// A modifier to specify the color of the checkbox's label
    /// - Parameter color: The color of the text label
    /// - Returns: The Modified Checkbox
    @available(macOS 11.0, *)
    func foregroundColor(_ color: Color) -> Checkbox {
        var checkbox = self
        checkbox.textColor = NSColor(color)
        
        return checkbox
    }
    
    /// A modifier to specify the color of the checkbox's label
    /// - Parameter color: The color of the text label
    /// - Returns: The Modified Checkbox
    @available(macOS 10.15, *)
    func foregroundColor(_ color: NSColor) -> Checkbox {
        var checkbox = self
        checkbox.textColor = color
        
        return checkbox
    }
}
