//
//  SearchField+Modifiers.swift
//  NSAlchemy
//
//  Created by Joshua Root on 1/30/25.
//

import SwiftUI

@available(macOS 10.15, *)
extension SearchField {
	/// A modifier that specifies the search query should be sent upon pressing the return/enter key.
	/// - Returns: The modified SearchField
    public func sendSearchOnReturn() -> SearchField {
        var field = self
        field.sendEntireSearchString = true
        
        return field
    }
	
	/// A modifier that specifies the name to be used to automatically save recent searches
	/// - Parameter name: The name used to refer to the storage of the recent searches
	/// - Returns: The modified SearchField
    public func autoSaveRecents(name: String) -> SearchField {
        var field = self
        field.recentsAutosaveName = name
        
        return field
    }
}
