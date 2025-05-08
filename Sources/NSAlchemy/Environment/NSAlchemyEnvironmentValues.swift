//
//  NSAlchemyEnvironmentValues.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/3/25.
//

import SwiftUI

public extension EnvironmentValues {
	@available(macOS 15.0, *)

	@Entry var fileDialog = FileDialog()
	
	@available(macOS 10.15, *)
	@Entry var localAuthenticator = LocalAuthenticator()
}
