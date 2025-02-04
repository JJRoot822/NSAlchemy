//
//  SearchField.swift
//  NSAlchemy
//
//  Created by Joshua Root on 1/30/25.
//

import SwiftUI

@available(macOS 10.15, *)
public struct SearchField: NSViewRepresentable {
    @Binding var text: String
    
    var sendEntireSearchString: Bool
    var maxRecents: Int
    var recentsAutosaveName: String?
    var placeholder: String
    
    public init(text: Binding<String>, prompt: String, maxRecents: Int) {
        self._text = text
        self.placeholder = prompt
        self.maxRecents = maxRecents
        self.sendEntireSearchString = false
    }
    
    public func makeNSView(context: Context) -> NSSearchField {
        var searchField = NSSearchField()
        searchField.maximumRecents = maxRecents
        searchField.sendsWholeSearchString = sendEntireSearchString
        searchField.stringValue = text
        searchField.placeholderString = placeholder
        searchField.target = context.coordinator
        searchField.action = #selector(context.coordinator.search)
    
        return searchField
    }
    
    public func updateNSView(_ nsView: NSSearchField, context: Context) {
        nsView.recentsAutosaveName = recentsAutosaveName
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

