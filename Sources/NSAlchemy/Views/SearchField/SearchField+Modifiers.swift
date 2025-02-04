//
//  SearchField+Modifiers.swift
//  NSAlchemy
//
//  Created by Joshua Root on 1/30/25.
//

import SwiftUI

@available(macOS 10.15, *)
extension SearchField {
    public func sendSearchOnReturn() -> SearchField {
        var field = self
        field.sendEntireSearchString = true
        
        return field
    }
    
    public func autoSaveRecents(name: String) -> SearchField {
        var field = self
        field.recentsAutosaveName = name
        
        return field
    }
}
