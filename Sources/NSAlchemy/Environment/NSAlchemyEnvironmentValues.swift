//
//  NSAlchemyEnvironmentValues.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/3/25.
//

import SwiftUI

public extension EnvironmentValues {
	/// THe environment key for opening file dialogs
	@available(macOS 15.0, *)
	@Entry var fileDialog = FileDialog()
	
	/// The environment key for requesting local authentication
	@available(macOS 10.15, *)
	@Entry var localAuthenticator = LocalAuthenticator()
}
