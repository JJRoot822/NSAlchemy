//
//  CircularButtonImageType.swift
//  NSAlchemy
//
//  Created by Joshua Root on 6/1/25.
//

import Foundation

/// Constants to indicate the kind of image to use for CircularButtons
@available(macOS 11.0, *)
public enum CircularButtonImageType {
	case noImage, asset(String), symbol(String)
}
