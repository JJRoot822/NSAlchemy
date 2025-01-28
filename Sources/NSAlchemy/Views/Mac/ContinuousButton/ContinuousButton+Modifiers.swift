//
//  ContinuousButton+Modifiers.swift
//  NSAlchemy
//
//  Created by Joshua Root on 1/28/25.
//

import SwiftUI

public extension ContinuousButton {
    /// A modifier to specify the color of the button
    /// - Parameter color: The color of the button
    /// - Returns: The modified ContinuousButton
    @available(macOS 11.0, *)
    func tintColor(_ color: Color) -> ContinuousButton {
        var button = self
        button.tintColor = NSColor(color)
        
        return button
    }
    
    /// A modifier to specify the color of the button
    /// - Parameter color: The color of the Button
    /// - Returns: The modified ContinuousButton
    func tintColor(_ color: NSColor) -> ContinuousButton {
        var button = self
        button.tintColor = color
        
        return button
    }
    
    /// A modifier to specify the color of the button's content
    /// - Parameter color: The color of the button's content
    /// - Returns: The modified ContinuousButton
    @available(macOS 11.0, *)
    func foregroundColor(_ color: Color) -> ContinuousButton {
        var button = self
        button.textColor = NSColor(color)
        
        return button
    }
    
    /// A modifier to specify the color of the button's content
    /// - Parameter color: The color of the button's content
    /// - Returns: The modified ContinuousButton
    func foregroundColor(_ color: NSColor) -> ContinuousButton {
        var button = self
        button.textColor = color
        
        return button
    }
}
