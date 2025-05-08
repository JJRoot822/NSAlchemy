//
//  FileDialog.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/2/25.
//

import Cocoa
import UniformTypeIdentifiers

/// An object  for opening an open or save panel for files or directories
@available(macOS 15.0, *)
public struct FileDialog {
	/// A method for configuring an open panel for opening files or a directory
	/// - Parameters:
	///   - selectionType: The kind of file system item you want to be able to open
	///   - prompt: The title of the main button in the open panel like "Open" or "Choose"
	///   - canCreateDirectories: Whether the user should be able to create new directories in the panel itself
	///   - allowsExtensionDisplayToggle: Whether the user should be able to toggle between showing or hiding file extensions
	///   - showsHiddenFiles: Whether the open panel should show hidden files and directories
	///   - resolvesAliases: Whether the URL returned by the open panel should point to the path to the file or directory an alias is pointing to, or the path of the alias itself
	///   - allowsMultipleSelection: Whether or not the user should be able to select multiple items
	///   - directoryURL: The path the panel shows initially when opened
	///   - allowedContentTypes: THe kind of files the user should be allowed to open. This parameter doesn't have an effect when selecting directories. When selecting files, an error will be thrown if it's nil or an empty array.
	/// - Returns: An instance of NSOpenPanel configured according to the provided preferences
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
	
	/// A method for configuring a save panel for saving a file or directory
	/// - Parameters:
	///   - selectionType: The kind of file system item you want to be able to save
	///   - prompt: The title of the main button in the open panel like "Save"
	///   - canCreateDirectories: Whether the user should be able to create new directories in the panel itself
	///   - allowsExtensionDisplayToggle: Whether the user should be able to toggle between showing or hiding file extensions
	///   - showsHiddenFiles: Whether the save panel should show hidden files and directories
	///   - directoryURL: The path the panel shows initially when opened
	///   - allowedContentTypes: THe kind of files the user should be allowed to save. This parameter doesn't have an effect when selecting directories. When selecting files, an error will be thrown if it's nil or an empty array.
	///   - showsContentTypes: Whether the save panel shows the allowed file types in a popup list
	/// - Returns: An instance of NSSavePanel configured according to the specified preferences
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
	
	/// A method to show the user an open panel for opening one or more files
	/// - Parameters:
	///   - prompt: The title of the main button in the open panel like "Open" or "Choose"
	///   - canCreateDirectories: Whether the user should be able to create new directories in the panel itself
	///   - allowsExtensionDisplayToggle: Whether the user should be able to toggle between showing or hiding file extensions
	///   - showsHiddenFiles: Whether the open panel should show hidden files and directories
	///   - resolvesAliases: Whether the URL returned by the open panel should point to the path to the file or directory an alias is pointing to, or the path of the alias itself
	///   - allowsMultipleSelection: Whether or not the user should be able to select multiple items
	///   - directoryURL: The path the panel shows initially when opened
	///   - allowedContentTypes: THe kind of files the user should be allowed to open. An error will be thrown if it's nil or an empty array.
	/// - Returns: An array of paths to the files that the user wants to open
	@MainActor func showOpenFilesDialog(prompt: String? = nil, canCreateDirectories: Bool = false, allowsExtensionDisplayToggle: Bool = false, showsHiddenFiles: Bool = false, resolvesAliases: Bool = true, allowsMultipleSelection: Bool = false, directoryURL: URL = FileManager.default.homeDirectoryForCurrentUser, allowedContentTypes: [UTType]) async throws -> [URL] {
		let panel = try configureOpenPanel(selectionType: .file, prompt: prompt, canCreateDirectories: canCreateDirectories, allowsExtensionDisplayToggle: allowsExtensionDisplayToggle, showsHiddenFiles: showsHiddenFiles, resolvesAliases: resolvesAliases, allowsMultipleSelection: allowsMultipleSelection, directoryURL: directoryURL, allowedContentTypes: allowedContentTypes)
		let response = await panel.begin()
		
		if response == .cancel {
			throw FileDialogError.canceled
		}
		
		return panel.urls
	}
	
	/// A method for showing the user an open panel for opening one or more directories
	/// - Parameters:
	///   - prompt: The title of the main button in the open panel like "Open" or "Choose"
	///   - canCreateDirectories: Whether the user should be able to create new directories in the panel itself
	///   - allowsExtensionDisplayToggle: Whether the user should be able to toggle between showing or hiding file extensions
	///   - showsHiddenFiles: Whether the open panel should show hidden files and directories
	///   - allowsMultipleSelection: Whether or not the user should be able to select multiple items
	///   - directoryURL: The path the panel shows initially when opened
	/// - Returns: An array of paths to the directories that the user wants to open
	@MainActor func showOpenDirectoriesDialog(prompt: String? = nil, canCreateDirectories: Bool = false, 	allowsExtensionDisplayToggle: Bool = false, 	showsHiddenFiles: Bool = false, allowsMultipleSelection: Bool = false, directoryURL: URL = FileManager.default.homeDirectoryForCurrentUser) async throws -> [URL] {
		let panel = try configureOpenPanel(selectionType: .directory, prompt: prompt, canCreateDirectories: canCreateDirectories, allowsExtensionDisplayToggle: allowsExtensionDisplayToggle, showsHiddenFiles: showsHiddenFiles, allowsMultipleSelection: allowsMultipleSelection, directoryURL: directoryURL)
		let response = await panel.begin()
		
		if response == .cancel {
			throw FileDialogError.canceled
		}
		
		return panel.urls
	}
	
	/// A method for opening a panel to save a file
	/// - Parameters:
	///   - prompt: The title of the main button in the save panel like "Save"
	///   - canCreateDirectories: Whether the user should be able to create new directories in the panel itself
	///   - allowsExtensionDisplayToggle: Whether the user should be able to toggle between showing or hiding file extensions
	///   - showsHiddenFiles: Whether the save panel should show hidden files and directories
	///   - directoryURL: The path the panel shows initially when opened
	///   - allowedContentTypes: THe kind of files the user should be allowed to save.When selecting files, an error will be thrown if it's nil or an empty array.
	///   - showsContentTypes: Whether the save panel shows the allowed file types in a popup list
	/// - Returns: A URL representing the path where you want to save a file
	@MainActor func showSaveFileDialog(prompt: String? = nil, canCreateDirectories: Bool = false, allowsExtensionDisplayToggle: Bool = false, showsHiddenFiles: Bool = false, directoryURL: URL = FileManager.default.homeDirectoryForCurrentUser, allowedContentTypes: [UTType]? = nil, showsContentTypes: Bool? = nil) async throws -> URL? {
		let panel = try configureSavePanel(selectionType: .file, prompt: prompt, canCreateDirectories: canCreateDirectories, allowsExtensionDisplayToggle: allowsExtensionDisplayToggle, showsHiddenFiles: showsHiddenFiles, directoryURL: directoryURL, allowedContentTypes: allowedContentTypes, showsContentTypes: showsContentTypes)
		let response = await panel.begin()
		
		if response == .cancel {
			throw FileDialogError.canceled
		}
		
		return panel.url
	}
	
	/// A method for displaying a panel to choose where to save a directory
	/// - Parameters:
	///   - selectionType: The kind of file system item you want to be able to save
	///   - prompt: The title of the main button in the save panel like "Save"
	///   - canCreateDirectories: Whether the user should be able to create new directories in the panel itself
	///   - allowsExtensionDisplayToggle: Whether the user should be able to toggle between showing or hiding file extensions
	///   - showsHiddenFiles: Whether the save panel should show hidden files and directories
	///   - directoryURL: The path the panel shows initially when opened
	/// - Returns: A URL representing the path to where you want to save a directory
	@MainActor func showSaveDirectoryDialog(prompt: String? = nil, canCreateDirectories: Bool = false, allowsExtensionDisplayToggle: Bool = false, showsHiddenFiles: Bool = false, directoryURL: URL = FileManager.default.homeDirectoryForCurrentUser) async throws -> URL? {
		let panel = try configureSavePanel(selectionType: .directory, prompt: prompt, canCreateDirectories: canCreateDirectories, allowsExtensionDisplayToggle: allowsExtensionDisplayToggle, showsHiddenFiles: showsHiddenFiles, directoryURL: directoryURL)
		let response = await panel.begin()
		
		if response == .cancel {
			throw FileDialogError.canceled
		}
		
		return panel.url
	}
}
