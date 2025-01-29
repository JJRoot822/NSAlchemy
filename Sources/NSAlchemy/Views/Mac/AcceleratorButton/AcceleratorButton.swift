//
//  Accelerator.swift
//  NSAlchemy
//
//  Created by Joshua Root on 1/28/25.
//

import SwiftUI

/// A button who's action runs continuously and the interval between each execution of the action decreases as more pressure is applied
///
///When supported, the time between executions of the button's action gets gradually faster the more pressure you apply while the button is being pressed.
@available(macOS 10.15, *)
public struct AcceleratorButton: NSViewRepresentable {
    var title: String
    var image: NSImage?
    var action: ((Double) -> Void)

    var contentStyle: ButtonContentStyle
    
    /// Creates an AcceleratorButton view with a title
    /// - Parameters:
    ///   - title: The button's title
    ///   - action: The action to execute while the button is pressed. Every time the action is executed, you are given a value between 1.0 and 2.0, which indicates the amount of pressure, or 0.0 if pressure sensitivity isn't supported..
    public init(_ title: String, action: @escaping (Double) -> Void) {
        self.title = title
        self.action = action
        self.contentStyle = .labelOnly
    }
    
    /// Creates an AcceleratorButton view with a title and image
    /// - Parameters:
    ///   - title: The button's title
    ///   - image: The image to use alongside the title for the button's content
    ///   - action: The action to execute while the button is pressed. Every time the action is executed, you are given a value between 1.0 and 2.0, which indicates the amount of pressure, or 0.0 if pressure sensitivity isn't supported..
    public init(_ title: String, image: String, action: @escaping (Double) -> Void) {
        self.title = title
        self.image = NSImage(named: image)
        self.action = action
        self.contentStyle = .labelAndIcon
    }
    
    /// Creates an AcceleratorButton view with a title and symbol
    /// - Parameters:
    ///   - title: The button's title
    ///   - systemImage: The symbol to use alongside the title for the button's content
    ///   - action: The action to execute while the button is pressed. Every time the action is executed, you are given a value between 1.0 and 2.0, which indicates the amount of pressure, or 0.0 if pressure sensitivity isn't supported..
    @available(macOS 11.0, *)
    public init(_ title: String, systemImage: String, action: @escaping (Double) -> Void) {
        self.title = title
        self.image = NSImage(systemSymbolName: systemImage, accessibilityDescription: nil)
        self.action = action
        self.contentStyle = .labelAndIcon
    }
    
    public func makeNSView(context: Context) -> NSButton {
        let button: NSButton = NSButton()
        button.setButtonType(.accelerator)
        button.isContinuous = true
        button.target = context.coordinator
        button.action = #selector(context.coordinator.buttonClicked)
        
        switch contentStyle {
        case .labelAndIcon:
            button.title = title
            button.image = image
        case .iconOnly:
            button.setAccessibilityLabel(title)
            button.image = image
        case .labelOnly:
            button.title = title
        }
        
        
        
        return button
    }
    
    public func updateNSView(_ nsView: NSButton, context: Context) {
        switch contentStyle {
        case .labelAndIcon:
            nsView.title = title
            nsView.setAccessibilityLabel(title)
            nsView.image = image
        case .iconOnly:
            if let image = image {
                nsView.title = ""
                nsView.setAccessibilityLabel(title)
                nsView.image = image
            } else {
                nsView.title = title
                nsView.setAccessibilityLabel(title)
                nsView.image = nil
            }
            
        case .labelOnly:
            nsView.title = title
            nsView.setAccessibilityLabel(title)
            nsView.image = nil
        }
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

