//
//  AcceleratorButton+LeveledInitializers.swift
//  NSAlchemy
//
//  Created by Joshua Root on 1/29/25.
//

import SwiftUI

extension AcceleratorButton {
    /// Creates an AcceleratorButton view with a title
    /// - Parameters:
    ///   - title: The button's title
    ///   - levels: The maximum number of pressure levels
    ///   - action: The action to execute while the button is pressed. Every time the action is executed, you are given a value between 1.0 and 2.0, which indicates the amount of pressure, or 0.0 if pressure sensitivity isn't supported..
    public init(_ title: String, levels: Int, action: @escaping (Double) -> Void) {
        self.title = title
        self.levels = levels
        self.action = action
        self.contentStyle = .labelOnly
    }
    
    /// Creates an AcceleratorButton view with a title and image
    /// - Parameters:
    ///   - title: The button's title
    ///   - image: The image to use alongside the title for the button's content
    ///   - levels: The maximum number of pressure levels
    ///   - action: The action to execute while the button is pressed. Every time the action is executed, you are given a value between 1.0 and 2.0, which indicates the amount of pressure, or 0.0 if pressure sensitivity isn't supported..
    public init(_ title: String, image: String, levels: Int, action: @escaping (Double) -> Void) {
        self.title = title
        self.image = NSImage(named: image)
        self.levels = levels
        self.action = action
        self.contentStyle = .labelAndIcon
    }
    
    /// Creates an AcceleratorButton view with a title and symbol
    /// - Parameters:
    ///   - title: The button's title
    ///   - systemImage: The symbol to use alongside the title for the button's content
    ///   - levels: The maximum pressure levels
    ///   - action: The action to execute while the button is pressed. Every time the action is executed, you are given a value between 1.0 and 2.0, which indicates the amount of pressure, or 0.0 if pressure sensitivity isn't supported..
    @available(macOS 11.0, *)
    public init(_ title: String, systemImage: String, levels: Int, action: @escaping (Double) -> Void) {
        self.title = title
        self.image = NSImage(systemSymbolName: systemImage, accessibilityDescription: nil)
        self.levels = levels
        self.action = action
        self.contentStyle = .labelAndIcon
    }
}
