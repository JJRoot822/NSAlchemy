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
    var title: String?
    var image: NSImage?
    var action: (() -> Void)

    var tintColor: NSColor
    var textColor: NSColor
    
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
    
        self.tintColor = .controlAccentColor
        self.textColor = .controlTextColor
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
        self.image = NSImage(named: image)
        self.delay =  delay
        self.interval = interval
        self.action = action
    
        self.tintColor = .controlAccentColor
        self.textColor = .controlTextColor
    }
    
    /// Creates a ContinuousButton view with an image
    /// - Parameters:
    ///   - image: The image to use for the button's content
    ///   - delay: The amount of time, in seconds, before the first time the button's action gets called. The delay can be a maximum of 60 seconds, and anything above that will be ignored with 60 being used in it's place.
    ///   - interval: The interval, in seconds, that the button's action will be called. The interval can be a maximum of 60 seconds, and anything above that will be ignored, with 60 being used in it's place.
    ///   - action: The code to be executed after a delay and at every interval while the button is pressed
    public init(image: String, delay: Float, interval: Float, action: @escaping () -> Void) {
        self.image = NSImage(named: image)
        self.delay =  delay
        self.interval = interval
        self.action = action
        
        self.tintColor = .controlAccentColor
        self.textColor = .controlTextColor
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
        self.image = NSImage(systemSymbolName: systemImage, accessibilityDescription: nil)
        self.delay =  delay
        self.interval = interval
        self.action = action
        
        self.tintColor = .controlAccentColor
        self.textColor = .controlTextColor
    }
    
    /// Creates a ContinuousButton view with a title and image
    /// - Parameters:
    ///   - systemImage: The symbol to use for the button's content
    ///   - delay: The amount of time, in seconds, before the first time the button's action gets called. The delay can be a maximum of 60 seconds, and anything above that will be ignored with 60 being used in it's place.
    ///   - interval: The interval, in seconds, that the button's action will be called. The interval can be a maximum of 60 seconds, and anything above that will be ignored, with 60 being used in it's place.
    ///   - action: The code to be executed after a delay and at every interval while the button is pressed
    @available(macOS 11.0, *)
    public init(systemImage: String, delay: Float, interval: Float, action: @escaping () -> Void) {
        self.image = NSImage(systemSymbolName: systemImage, accessibilityDescription: nil)
        self.delay =  delay
        self.interval = interval
        self.action = action
        
        self.tintColor = .controlAccentColor
        self.textColor = .controlTextColor
    }
    
    public func makeNSView(context: Context) -> NSButton {
        let button: NSButton = NSButton()
        button.setPeriodicDelay(delay, interval: interval)
        button.contentTintColor = textColor
        button.bezelColor = tintColor
        button.target = context.coordinator
        button.action = #selector(context.coordinator.buttonClicked)
        
        if let title = title {
            button.title = title
        }
        
        if let image = image {
            button.image = image
        }
        
        return button
    }
    
    public func updateNSView(_ nsView: NSButton, context: Context) {
        nsView.contentTintColor = textColor
        nsView.bezelColor = tintColor
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

