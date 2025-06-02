//
//  FileDialogError.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/3/25.
//

import Foundation

/// The various possible errors when working with file dialogs
@available(macOS 15.0, *)
public enum FileDialogError: Error {
	case canceled, noContentTypes, noShowingContentTypes, invalidContentTypesSettings
}
