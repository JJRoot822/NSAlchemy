//
//  AcceleratorButton.swift
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
    var levels: Int?
    var action: ((Double) -> Void)

    var contentStyle: ButtonContentStyle
    
    public func makeNSView(context: Context) -> NSButton {
        let button: NSButton = NSButton()
        button.isContinuous = true
        button.target = context.coordinator
        button.action = #selector(context.coordinator.buttonClicked)

        if let levels = levels {
            button.setButtonType(.multiLevelAccelerator)
            button.maxAcceleratorLevel = levels
        } else {
            button.setButtonType(.accelerator)
        }
        
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

