//
//  EnvironmentValues+FileDialog.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/3/25.
//

import SwiftUI

@available(macOS 15.0, *)
public extension EnvironmentValues {
	@Entry var fileDialog = FileDialog()
}
