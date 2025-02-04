//
//  SegmentedControlItem.swift
//  NSAlchemy
//
//  Created by Joshua Root on 2/3/25.
//

import Foundation

@available(macOS 10.15, *)
public struct SegmentedControlItem: Hashable {
    var title: String
    var image: String? = nil
    var tag: Int
}
