//
//  ROMColor+Extensions.swift
//  Romita
//
//  Created by William Towe on 10/14/23.
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
public extension ROMColor {
    // MARK: - Public Types
    enum ColorSpace {
        case gray
        case hsb
        case rgb
        
        internal var max: Int {
            switch self {
            case .gray, .rgb:
                return 255
            case .hsb:
                return 240
            }
        }
    }
    
    // MARK: - Public Functions
    static func random(inColorSpace colorSpace: ColorSpace, alpha: CGFloat? = nil) -> ROMColor {
        let alpha = alpha ?? CGFloat.random(in: 0.0...1.0)
        
        switch colorSpace {
        case .gray:
            let white = CGFloat(Int.random(in: 0...colorSpace.max)) / CGFloat(colorSpace.max)
            
            return ROMColor(white: white, alpha: alpha)
        case .hsb:
            let hue = CGFloat(Int.random(in: 0...colorSpace.max)) / CGFloat(colorSpace.max)
            let saturation = CGFloat(Int.random(in: 0...colorSpace.max)) / CGFloat(colorSpace.max)
            let brightness = CGFloat(Int.random(in: 0...colorSpace.max)) / CGFloat(colorSpace.max)
            
            return ROMColor(hue: hue, saturation: saturation, brightness: brightness, alpha: alpha)
        case .rgb:
            let red = CGFloat(Int.random(in: 0...colorSpace.max)) / CGFloat(colorSpace.max)
            let green = CGFloat(Int.random(in: 0...colorSpace.max)) / CGFloat(colorSpace.max)
            let blue = CGFloat(Int.random(in: 0...colorSpace.max)) / CGFloat(colorSpace.max)
            
            return ROMColor(red: red, green: green, blue: blue, alpha: alpha)
        }
    }
}
#endif
