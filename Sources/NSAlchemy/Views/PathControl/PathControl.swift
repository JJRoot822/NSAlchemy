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
	var singleClickAction: ((URL?)-> Void)?
	var doubleClickAction: ((URL?) -> Void)?
    
    /// Creates a PathControl with a URL to display.
    /// - Parameters:
    ///   - url: The URL object that represents the path to a file on the user's system.
    public init(url: URL) {
        self.url = url
		self.singleClickAction = nil
		self.doubleClickAction = nil
    }
    
    public func makeNSView(context: Context) -> NSPathControl {
        let pathControl = NSPathControl()
        pathControl.url = url
        
        return pathControl
    }
	
	public func makeCoordinator() -> Coordinator {
		return Coordinator(self)
	}
    
	public func updateNSView(_ nsView: NSPathControl, context: Context) {
		if let _ = singleClickAction {
			nsView.target = context.coordinator
			nsView.action = #selector(context.coordinator.componentSingleClicked)
		}
		
		if let _ = doubleClickAction {
			nsView.target = context.coordinator
			nsView.action = #selector(context.coordinator.componentDoubleClicked)
		}
	}
}
