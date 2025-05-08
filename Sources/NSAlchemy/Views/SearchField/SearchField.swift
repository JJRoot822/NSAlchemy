//
//  SearchField.swift
//  NSAlchemy
//
//  Created by Joshua Root on 1/30/25.
//

import SwiftUI

/// A view representing a search field
@available(macOS 10.15, *)
public struct SearchField: NSViewRepresentable {
    @Binding var text: String
    
    var sendEntireSearchString: Bool
    var maxRecents: Int
    var recentsAutosaveName: String?
    var placeholder: String
	var completions: [String]?
	
	/// Creates a SearchField
	/// - Parameters:
	///   - text: The binding to the text for the SearchField
	///   - prompt: the placeholder text for the SearchField
	///   - maxRecents: The maximum number of search queries this SearchField remembers.
	public init(text: Binding<String>, prompt: String, maxRecents: Int) {
		self._text = text
		self.placeholder = prompt
		self.maxRecents = maxRecents
		self.sendEntireSearchString = false
		self.completions = nil
	}
	
	/// Creates a SearchField
	/// - Parameters:
	///   - text: The binding to the text for the SearchField
	///   - prompt: the placeholder text for the SearchField
	///   - maxRecents: The maximum number of search queries this SearchField remembers.
	///   - completions: The potential completions for the search field
	public init(text: Binding<String>, prompt: String, maxRecents: Int, completions: [String]) {
		self._text = text
		self.placeholder = prompt
		self.maxRecents = maxRecents
		self.sendEntireSearchString = false
		self.completions = completions
	}
    
    public func makeNSView(context: Context) -> NSSearchField {
        let searchField = NSSearchField()
        searchField.maximumRecents = maxRecents
        searchField.sendsWholeSearchString = sendEntireSearchString
        searchField.stringValue = text
        searchField.placeholderString = placeholder
        searchField.target = context.coordinator
        searchField.action = #selector(context.coordinator.search)
		
		if let completions = completions {
			searchField.delegate = context.coordinator
			searchField.isAutomaticTextCompletionEnabled = true
		}
		
        return searchField
    }
    
    public func updateNSView(_ nsView: NSSearchField, context: Context) {
        nsView.recentsAutosaveName = recentsAutosaveName
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}

