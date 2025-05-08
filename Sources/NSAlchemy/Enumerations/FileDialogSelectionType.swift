//
//  FileDialogSelectionType.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/3/25.
//

import Foundation

/// Constants for determining what kind of file operation panel to display to the user
@available(macOS 15.0, *)
public enum FileDialogSelectionType {
	case file, directory
}
