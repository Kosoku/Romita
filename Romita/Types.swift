//
//  Types.swift
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

/**
 Typealias for color values on iOS/tvOS.
 */
public typealias ROMColor = UIColor
/**
 Typealias for image values on iOS/tvOS.
 */
public typealias ROMImage = UIImage
/**
 Typealias for point values on iOS/tvOS.
 */
public typealias ROMPoint = CGPoint
/**
 Typealias for layout constraint priority values on iOS/tvOS.
 */
public typealias ROMLayoutConstraintPriority = UILayoutPriority
/**
 Typealias for view values on iOS/tvOS.
 */
public typealias ROMView = UIView
#elseif os(watchOS)
import UIKit
import WatchKit

/**
 Typealias for image values on watchOS.
 */
public typealias ROMImage = UIImage
#else
import AppKit

/**
 Typealias for color values on macOS.
 */
public typealias ROMColor = NSColor
/**
 Typealias for image values on macOS.
 */
public typealias ROMImage = NSImage
/**
 Typealias for point values on macOS.
 */
public typealias ROMPoint = NSPoint
/**
 Typealias for layout constraint priority values on macOS.
 */
public typealias ROMLayoutConstraintPriority = NSLayoutConstraint.Priority
/**
 Typealias for view values on macOS.
 */
public typealias ROMView = NSView
#endif
