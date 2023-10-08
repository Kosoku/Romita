//
//  DynamicColor.swift
//  Romita
//
//  Created by William Towe on 10/7/23.
//  Copyright © 2023 Kosoku Interactive, LLC. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

import Foundation
#if os(iOS) || os(tvOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

#if os(iOS) || os(tvOS) || os(macOS)
/**
 Property wrapper which returns a dynamic `NSColor` or `UIColor` that will return the appropriate color.
 
 ```
 extension ROMColor {
    @DynamicColor(lightModeColor: .systemYellow, darkModeColor: .systemGreen)
    static var foregroundColor: ROMColor
 
    // do something with foregroundColor which will update based on the system
 }
 ```
 */
@propertyWrapper
struct DynamicColor {
    // MARK: - Public Properties
    /**
     Returns the property wrapper itself, using the `$` syntax.
     */
    var projectedValue: DynamicColor {
        self
    }
    
    /**
     Returns the wrapped color value.
     */
    var wrappedValue: ROMColor {
        #if os(iOS) || os(tvOS)
        UIColor {
            switch $0.userInterfaceStyle {
            case .unspecified, .light:
                return self.lightModeColor
            case .dark:
                return self.darkModeColor
            @unknown default:
                return self.lightModeColor
            }
        }
        #else
        NSColor(name: nil) {
            switch $0.name {
            case NSAppearance.Name.aqua:
                return self.lightModeColor
            case NSAppearance.Name.darkAqua:
                return self.darkModeColor
            default:
                return self.lightModeColor
            }
        }
        #endif
    }
    
    // MARK: - Private Properties
    private let lightModeColor: ROMColor
    private let darkModeColor: ROMColor
    
    // MARK: - Initializers
    /**
     Creates an instance wrapping the provided `lightModeColor` and `darkModeColor` values.
     
     - Parameter lightModeColor: The light mode color
     - Parameter darkModeColor: The dark mode color
     - Returns: The instance
     */
    init(lightModeColor: ROMColor, darkModeColor: ROMColor) {
        self.lightModeColor = lightModeColor
        self.darkModeColor = darkModeColor
    }
}
#endif
