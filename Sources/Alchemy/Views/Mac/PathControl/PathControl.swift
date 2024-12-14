//
//  PathControl.swift
//  NSAlchemy
//
//  Created by Joshua Root on 12/11/24.
//

import SwiftUI

/// A view for displaying a visual representation of a file's path on the system.
@available(macOS 10.15, *)
public struct PathControl: NSViewRepresentable {
    var url: URL
    var doubleClickAction: (() -> Void)?
    
    /// Creates a PathControl with a URL to display and an optional double click action.
    /// - Parameters:
    ///   - url: The URL object that represents the path to a file on the user's system.
    ///   - doubleClickAction: An optional double click handler.
    public init(url: URL, doubleClickAction: (() -> Void)? = nil) {
        self.url = url
        self.doubleClickAction = doubleClickAction
    }
    
    public func makeNSView(context: Context) -> NSPathControl {
        let pathControl = NSPathControl()
        pathControl.url = url
        pathControl.doubleAction = #selector(context.coordinator.doubleClicked)
        
        return pathControl
    }
    
    public func updateNSView(_ nsView: NSPathControl, context: Context) {}
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}
