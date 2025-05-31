//
//  ContinuousButton.swift
//  NSAlchemy
//
//  Created by Joshua Root on 1/28/25.
//

import SwiftUI

/// A button who's action runs after a delay and after a given interval while pressed.
@available(macOS 10.15, *)
public struct ContinuousButton: NSViewRepresentable {
    var delay: Float
    var interval: Float
    var title: String
    var image: NSImage?
    var action: (() -> Void)

    var contentStyle: ButtonContentStyle
    
    /// Creates a ContinuousButton view with a title
    /// - Parameters:
    ///   - title: The title of the button
    ///   - delay: The amount of time, in seconds, before the first time the button's action gets called. The delay can be a maximum of 60 seconds, and anything above that will be ignored with 60 being used in it's place.
    ///   - interval: The interval, in seconds, that the button's action will be called. The interval can be a maximum of 60 seconds, and anything above that will be ignored, with 60 being used in it's place.
    ///   - action: The code to be executed after a delay and at every interval while the button is pressed.
    public init(_ title: String, delay: Float, interval: Float, action: @escaping () -> Void) {
        self.title = title
        self.delay =  delay
        self.interval = interval
        self.action = action
        contentStyle = .labelOnly
    }
    
    /// Creates a ContinuousButton view with a title and image
    /// - Parameters:
    ///   - title: The title of the button
    ///   - image: The image to use alongside the title of the button
    ///   - delay: The amount of time, in seconds, before the first time the button's action gets called. The delay can be a maximum of 60 seconds, and anything above that will be ignored with 60 being used in it's place.
    ///   - interval: The interval, in seconds, that the button's action will be called. The interval can be a maximum of 60 seconds, and anything above that will be ignored, with 60 being used in it's place.
    ///   - action: The code to be executed after a delay and at every interval while the button is pressed
    public init(_ title: String, image: String, delay: Float, interval: Float, action: @escaping () -> Void) {
        self.title = title
        
		if let image = NSImage(named: image) {
			self.image = image
		} else {
			fatalError("When using this initializer, a valid image with the given name must be present in the asset catalog.")
		}
        
		self.delay =  delay
        self.interval = interval
        self.action = action
        self.contentStyle = .labelAndIcon
    }
    
    /// Creates a ContinuousButton view with a title and image
    /// - Parameters:
    ///   - title: The title of the button
    ///   - systemImage: The symbol to use alongside the title of the button
    ///   - delay: The amount of time, in seconds, before the first time the button's action gets called. The delay can be a maximum of 60 seconds, and anything above that will be ignored with 60 being used in it's place.
    ///   - interval: The interval, in seconds, that the button's action will be called. The interval can be a maximum of 60 seconds, and anything above that will be ignored, with 60 being used in it's place.
    ///   - action: The code to be executed after a delay and at every interval while the button is pressed
    @available(macOS 11.0, *)
    public init(_ title: String, systemImage: String, delay: Float, interval: Float, action: @escaping () -> Void) {
        self.title = title
        
		if let image = NSImage(systemSymbolName: systemImage, accessibilityDescription: nil) {
			self.image = image
		} else {
			fatalError("When using this initializer, a valid SF Symbol must be present.")
		}
        
		self.delay =  delay
        self.interval = interval
        self.action = action
        self.contentStyle = .labelAndIcon
    }
    
    public func makeNSView(context: Context) -> NSButton {
        let button: NSButton = NSButton()
        button.setPeriodicDelay(delay, interval: interval)
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
            if let image = image {
				nsView.title = title
				nsView.image = image
				nsView.setAccessibilityLabel(title)
			} else {
				fatalError("In order to use the labelAndIcon continuous button style, there must be an image or symbol specified in the initializer.")
			}
        case .iconOnly:
            if let image = image {
                nsView.title = ""
                nsView.setAccessibilityLabel(title)
                nsView.image = image
			} else {
				fatalError("In order to use the iconOnly continuous button type, there must be an image or symbol specified in the initializer.")
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

