//
//  SegmentedControlItem.swift
//  NSAlchemy
//
//  Created by Joshua Root on 2/3/25.
//

import Foundation

/// An object representing a segment of a SegmentedControl
@available(macOS 10.15, *)
public struct SegmentedControlItem: Hashable {
    var title: String
    var image: String? = nil
    var tag: Int
	
	/// Creates a new SegmentedControlItem
	/// - Parameters:
	///   - title: The text used as the title or accessibility label for the segment
	///   - image: The optional image to use for the segment. This can be an SF Symbol or a named asset
	///   - tag: An integer value used to uniquely identify the segment
	public init(title: String, image: String? = nil, tag: Int) {
		self.title = title
		self.image = image
		self.tag = tag
	}
}
