# NSAlchemy
## A Package of Useful macOS Controls for SwiftUI

### What is NSAlchemy?

NSAlchemy is a Swift package that contains a few useful views for developing macOS apps that SwiftUI doesn't have equivalents for yet or who's native SwiftUI counterparts perform badly in common use cases.
As of December 14, 2024, the package contains the following views:
- HSlider: A horizontal slider with various customization options including tick marks and the ability to change the track color.
- VSlider: A vertical slider that has the same customization options as HSlider, but is oriented vertically.
- CircularSlider: A Circular slider that has a few options to customize it, but not as much as the previous mentioned ones. This slider acts much more like a knob.
- LevelIndicator: A view that can reflect capacity levels or ratings. This view contains many customizations, including the ability to change the colors for warning and critical levels for the capacity style indicator and the ability to use custom assets for the rating images.
- PathControl: A simple view that displays a visual representation of the path to a file.
- ComboBox: A view that combines a text field and a pulldown list for selection between multiple options.

# Installation Instructions

To install this package, you must use Swift Package Manager (SPM).

1. When you are in an Xcode project, go to File > Add Package Dependencies
2. Enter the URL https://www.github.com/JJRoot822/NSAlchemy
3. Hit enter and select NSAlchemy from the results.
4. Press Add Package, and then press Add Package again.

### Slider Examples

swift
```

import SwiftUI
import NSAlchemy

struct ContentView: View {
    @State private var volume: Double = 0
    
    var body: some View {
        HStack {
            HSlider(value: $volume, label: "Volume Level", min: 0, max: 100, altStep: 5, allowsTickMarks: true)
                .tickMarks(number: 200, stepByTicks: true, position: .above)
        
            VSlider(value: $volume, label: "Volume Level", min: 0, max: 100, altStep: 5, allowsTickMarks: true)
                .tickMarks(number: 200, stepByTicks: true, position: .leading)
        
            CircularSlider(value: $volume, label: "Volume Level", min: 0, max: 100, altStep: 5, allowTickMarks: false)
        }
    }
}
```

### Level Indicator Examples

swift
```

import SwiftUI
import NSAlchemy

struct ContentView: View {
    var body: some View {
        VStack(spacing: 50) {
            VStack {
                Text("300GB of 1TB")
                
                LevelIndicator("Disk Space", value: 300, minValue: 0, maxValue: 1024)
                    .indicatorWarning(fraction: 0.51, color: .yellow)
                    .indicatorCritical(fraction: 0.75, color: .red)
                    .indicatorFill(color: .green)
            }
            
            VStack {
                Text("Rating for Five Nights at Freddy's (Movie)")
                LevelIndicator("Movie Rating", value: 4, minValue: 0, maxValue: 5, ratingImageSymbol: "star.fill", ratingPlaceholderImageSymbol: "star", placeholderVisibility: .always)
                    .indicatorFill(color: .yellow)
            }
            }
    }
}
```

### PathControl Example

swift
```

import SwiftUI
import NSAlchemy

struct ContentView: View {
    let path = URL(string: "\(FileManager.default.homeDirectoryForCurrentUser)/Desktop/Portfolio")!
    
    var body: some View {
        VStack {
            PathControl(url: path)
            
            Spacer()
        }
    }
}
```

### ComboBox Example

swift
```

import SwiftUI
import NSAlchemy

struct ContentView: View {
    @State private var selection: String = Constants.locations[0].name
    
    private let locations = Constants.locations.map { $0.name }
    
    var body: some View {
        ComboBox(label: "U.S. Landmarks", selection: $selection, hasScroller: false, completes: true, items: locations)
    }
}
```