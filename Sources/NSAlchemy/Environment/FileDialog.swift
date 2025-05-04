//
//  FileDialog.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/2/25.
//

import Cocoa
import UniformTypeIdentifiers

@available(macOS 15.0, *)
public struct FileDialog {
	@MainActor private func configureOpenPanel(selectionType: FileDialogSelectionType, prompt: String? = nil, canCreateDirectories: Bool = false, allowsExtensionDisplayToggle: Bool = false, showsHiddenFiles: Bool = false, resolvesAliases: Bool = true, allowsMultipleSelection: Bool = false, directoryURL: URL = FileManager.default.homeDirectoryForCurrentUser, allowedContentTypes: [UTType]? = nil) throws -> NSOpenPanel {
		let panel = NSOpenPanel()
		panel.canCreateDirectories = canCreateDirectories
		panel.canSelectHiddenExtension = allowsExtensionDisplayToggle
		panel.showsHiddenFiles = showsHiddenFiles
		panel.resolvesAliases = resolvesAliases
		panel.allowsMultipleSelection = allowsMultipleSelection
		panel.directoryURL = directoryURL
		
		switch selectionType {
		case .file:
			panel.canChooseFiles = true
			panel.canChooseDirectories = false
			
			if let allowedContentTypes = allowedContentTypes {
				if allowedContentTypes.isEmpty {
					throw FileDialogError.noContentTypes
				} else {
					panel.allowedContentTypes = allowedContentTypes
				}
			} else {
				throw FileDialogError.noContentTypes
			}
		case .directory:
			panel.canChooseFiles = false
			panel.canChooseDirectories = true
		}
		
		if let prompt = prompt {
			panel.prompt = prompt
		}
		
		return panel
	}

	

	@MainActor private func configureSavePanel(selectionType: FileDialogSelectionType, prompt: String? = nil, canCreateDirectories: Bool = false, allowsExtensionDisplayToggle: Bool = false, showsHiddenFiles: Bool = false, directoryURL: URL = FileManager.default.homeDirectoryForCurrentUser, allowedContentTypes: [UTType]? = nil, showsContentTypes: Bool? = nil) throws -> NSSavePanel {
		let panel = NSSavePanel()
		panel.canCreateDirectories = canCreateDirectories
		panel.canSelectHiddenExtension = allowsExtensionDisplayToggle
		panel.showsHiddenFiles = showsHiddenFiles
		panel.directoryURL = directoryURL
	
		if selectionType == .file {
			if allowedContentTypes == nil && showsContentTypes != nil {
				throw FileDialogError.noContentTypes
			}
			
			if allowedContentTypes != nil && showsContentTypes == nil {
				throw FileDialogError.noShowingContentTypes
			}
			
			if allowedContentTypes == nil && showsContentTypes == nil {
				throw FileDialogError.invalidContentTypesSettings
			}
			
			if let allowedContentTypes = allowedContentTypes,
			   let showsContentTypes = showsContentTypes {
				panel.allowedContentTypes = allowedContentTypes
				panel.showsContentTypes = showsContentTypes
			}
		}
		
		if let prompt = prompt {
			panel.prompt = prompt
		}
		
		return panel
	}
	
	@MainActor func showOpenFilesDialog(prompt: String? = nil, canCreateDirectories: Bool = false, allowsExtensionDisplayToggle: Bool = false, showsHiddenFiles: Bool = false, resolvesAliases: Bool = true, allowsMultipleSelection: Bool = false, directoryURL: URL = FileManager.default.homeDirectoryForCurrentUser, allowedContentTypes: [UTType]) async throws -> [URL] {
		let panel = try configureOpenPanel(selectionType: .file, prompt: prompt, canCreateDirectories: canCreateDirectories, allowsExtensionDisplayToggle: allowsExtensionDisplayToggle, showsHiddenFiles: showsHiddenFiles, resolvesAliases: resolvesAliases, allowsMultipleSelection: allowsMultipleSelection, directoryURL: directoryURL, allowedContentTypes: allowedContentTypes)
		let response = await panel.begin()
		
		if response == .cancel {
			throw FileDialogError.canceled
		}
		
		return panel.urls
	}
	
	@MainActor func showOpenDirectoriesDialog(prompt: String? = nil, canCreateDirectories: Bool = false, 	allowsExtensionDisplayToggle: Bool = false, 	showsHiddenFiles: Bool = false, allowsMultipleSelection: Bool = false, directoryURL: URL = FileManager.default.homeDirectoryForCurrentUser) async throws -> [URL] {
		let panel = try configureOpenPanel(selectionType: .directory, prompt: prompt, canCreateDirectories: canCreateDirectories, allowsExtensionDisplayToggle: allowsExtensionDisplayToggle, showsHiddenFiles: showsHiddenFiles, allowsMultipleSelection: allowsMultipleSelection, directoryURL: directoryURL)
		let response = await panel.begin()
		
		if response == .cancel {
			throw FileDialogError.canceled
		}
		
		return panel.urls
	}
	
	@MainActor func showSaveFileDialog(selectionType: FileDialogSelectionType, prompt: String? = nil, canCreateDirectories: Bool = false, allowsExtensionDisplayToggle: Bool = false, showsHiddenFiles: Bool = false, directoryURL: URL = FileManager.default.homeDirectoryForCurrentUser, allowedContentTypes: [UTType]? = nil, showsContentTypes: Bool? = nil) async throws -> URL? {
		let panel = try configureSavePanel(selectionType: .file, prompt: prompt, canCreateDirectories: canCreateDirectories, allowsExtensionDisplayToggle: allowsExtensionDisplayToggle, showsHiddenFiles: showsHiddenFiles, directoryURL: directoryURL, allowedContentTypes: allowedContentTypes, showsContentTypes: showsContentTypes)
		let response = await panel.begin()
		
		if response == .cancel {
			throw FileDialogError.canceled
		}
		
		return panel.url
	}
	
	@MainActor func showSaveDirectoryDialog(selectionType: FileDialogSelectionType, prompt: String? = nil, canCreateDirectories: Bool = false, allowsExtensionDisplayToggle: Bool = false, showsHiddenFiles: Bool = false, directoryURL: URL = FileManager.default.homeDirectoryForCurrentUser, allowedContentTypes: [UTType]? = nil, showsContentTypes: Bool? = nil) async throws -> URL? {
		let panel = try configureSavePanel(selectionType: .directory, prompt: prompt, canCreateDirectories: canCreateDirectories, allowsExtensionDisplayToggle: allowsExtensionDisplayToggle, showsHiddenFiles: showsHiddenFiles, directoryURL: directoryURL)
		let response = await panel.begin()
		
		if response == .cancel {
			throw FileDialogError.canceled
		}
		
		return panel.url
	}
}
