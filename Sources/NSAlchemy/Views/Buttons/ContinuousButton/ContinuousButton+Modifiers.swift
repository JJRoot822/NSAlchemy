//
//  ContinuousButton+Modifiers.swift
//  NSAlchemy
//
//  Created by Joshua Root on 1/29/25.
//

import SwiftUI

@available(macOS 10.15, *)
public extension ContinuousButton {
    /// A modifier to configure the content of the ContinuousButton
    /// - Parameter style: The style configureation for the button's content
    /// - Returns: The modified ContinuousButton
    func buttonContentStyle(_ style: ButtonContentStyle) -> ContinuousButton {
        var button = self
        button.contentStyle = style
        
        return button
    }
}
