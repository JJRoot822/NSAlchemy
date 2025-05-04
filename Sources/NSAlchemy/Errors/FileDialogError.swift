//
//  FileDialogError.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/3/25.
//

import Foundation

@available(macOS 15.0, *)
public enum FileDialogError: Error {
	case canceled, noContentTypes, noShowingContentTypes, invalidContentTypesSettings
}
