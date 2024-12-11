//
//  PathControl.swift
//  NSAlchemy
//
//  Created by Joshua Root on 12/11/24.
//

import SwiftUI

extension PathControl {
    class Coordinator: NSResponder {
        private var parent: PathControl
        
        init(_ parent: PathControl) {
            self.parent = parent
        
            super.init()
        }
        
        required init?(coder: NSCoder) {
            fatalError("Not Supported")
        }
        
        @objc func doubleClicked() {
            guard let doubleClickAction = parent.doubleClickAction else { return }
            
            doubleClickAction()
        }
    }
}

struct PathControl: NSViewRepresentable {
    var url: URL
    var doubleClickAction: (() -> Void)?
    
    /// Creates a PathControl with a URL to display and an optional double click action.
    /// - Parameters:
    ///   - url: The URL object that represents the path to a file on the user's system.
    ///   - doubleClickAction: An optional double click handler.
    init(url: URL, doubleClickAction: (() -> Void)? = nil) {
        self.url = url
        self.doubleClickAction = doubleClickAction
    }
    
    func makeNSView(context: Context) -> NSPathControl {
        let pathControl = NSPathControl()
        pathControl.url = url
        pathControl.doubleAction = #selector(context.coordinator.doubleClicked)
        
        return pathControl
    }
    
    func updateNSView(_ nsView: NSPathControl, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}
