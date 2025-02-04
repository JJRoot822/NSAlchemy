//
//  SegmentedControl.swift
//  NSAlchemy
//
//  Created by Joshua Root on 2/3/25.
//

import SwiftUI

@available(macOS 11.0, *)
public struct SegmentedControl: NSViewRepresentable {
    @Binding var selection: Set<SegmentedControlItem>
    
    var title: String
    var items: [SegmentedControlItem]
    var segmentedControlStyle: SegmentedControlStyle
    var segmentStyle: SegmentType
    var selectedSegmentTintColor: Color
    var distributionStyle: SegmentedControlDistributionStyle
    var selectionMode: SegmentedControlSelectionMode
    
    public init(_ title: String, selection: Binding<Set<SegmentedControlItem>>, items: [SegmentedControlItem], selectionMode: SegmentedControlSelectionMode, segmentContentStyle: SegmentType) {
        self._selection = selection
        self.title = title
        self.items = items
        self.segmentedControlStyle = .automatic
        self.selectedSegmentTintColor = Color(NSColor.selectedControlColor)
        self.distributionStyle = .fillEqually
        self.selectionMode = selectionMode
        self.segmentStyle = segmentContentStyle
    }
    
    public func makeNSView(context: Context) -> NSSegmentedControl {
        var segmentedControl: NSSegmentedControl
        
        switch segmentStyle {
        case .title:
            let titles = items.map { $0.title }
            
            segmentedControl = NSSegmentedControl(
                labels: titles,
                trackingMode: SegmentedControlSelectionMode.cocoaMode(for: selectionMode),
                target: context.coordinator,
                action: #selector(context.coordinator.segmentClicked)
            )
        case .namedImage:
            let nilCount = items.count { $0.image == nil }
            
            guard nilCount == 0 else {
                fatalError("No image of a SegmentItem in the array of items can be nil when the segment type is set to namedImage or symbolImage")
            }
            
            let images = items.map { NSImage(named: $0.image!)! }
            
            segmentedControl = NSSegmentedControl(
                images: images,
                trackingMode: SegmentedControlSelectionMode.cocoaMode(for: selectionMode),
                target: context.coordinator,
                action: #selector(context.coordinator.segmentClicked)
            )
        case .symbolImage:
            let imagePropertyNilCount = items.count { $0.image == nil }
            
            guard imagePropertyNilCount == 0 else {
                fatalError("No image of a SegmentItem in the array of items can be nil when the segment type is set to namedImage or symbolImage")
            }
            
            let imageNilCount = items.count { NSImage(systemSymbolName: $0.image!, accessibilityDescription: $0.title) == nil }
            
            guard imageNilCount == 0 else {
                fatalError("The segment type is set to symbolImage, but the symbol's name you provided is not a valid SF Symbol.")
            }
            
            let images = items.map { NSImage(systemSymbolName: $0.image!, accessibilityDescription: $0.title)! }
            
            segmentedControl = NSSegmentedControl(
                images: images,
                trackingMode: SegmentedControlSelectionMode.cocoaMode(for: selectionMode),
                target: context.coordinator,
                action: #selector(context.coordinator.segmentClicked)
            )
        }
        
        segmentedControl.segmentStyle = SegmentedControlStyle.cocoaStyle(for: segmentedControlStyle)
        segmentedControl.selectedSegmentBezelColor = NSColor(selectedSegmentTintColor)
        segmentedControl.segmentDistribution = SegmentedControlDistributionStyle.cocoaDistribution(for: distributionStyle)
        segmentedControl.setAccessibilityLabel(title)
        
        for item in items {
            segmentedControl.setTag(item.tag, forSegment: items.firstIndex(of: item)!)
        }
        
        return segmentedControl
    }
    
    public func updateNSView(_ nsView: NSSegmentedControl, context: Context) {
        nsView.segmentStyle = SegmentedControlStyle.cocoaStyle(for: segmentedControlStyle)
        nsView.selectedSegmentBezelColor = NSColor(selectedSegmentTintColor)
        nsView.segmentDistribution = SegmentedControlDistributionStyle.cocoaDistribution(for: distributionStyle)
    }
    
    public func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
}
