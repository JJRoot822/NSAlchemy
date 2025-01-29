//
//  AcceleratorButton+Modifiers.swift
//  NSAlchemy
//
//  Created by Joshua Root on 1/29/25.
//

import SwiftUI

@available(macOS 10.15, *)
public extension AcceleratorButton {
    /// A modifier to configure the content of the AcceleratorButton
    /// - Parameter style: The style configureation for the button's content
    /// - Returns: The modified AcceleratorButton
    func buttonContentStyle(_ style: ButtonContentStyle) -> AcceleratorButton {
        var button = self
        button.contentStyle = style
        
        return button
    }
}
