//
//  GradientButtonImageType.swift
//  NSAlchemy
//
//  Created by Joshua Root on 5/31/25.
//

import Foundation

/// Constants for the kind of image to use for a GradientButton
@available(macOS 11.0, *)
public enum GradientButtonImageType {
	case asset(String), symbol(String)
}
