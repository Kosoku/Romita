//
//  GradientView.swift
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

import Feige
import Foundation
#if os(iOS) || os(tvOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

#if os(iOS) || os(tvOS) || os(macOS)
/**
 View backed by a `CAGradientLayer`.
 */
open class GradientView: ROMView {
    // MARK: - Public Properties
    /**
     Get/set the colors that are used by the underlying `CAGradientLayer`.
     */
    open var colors: [ROMColor] {
        get {
            ((self.gradientLayer.colors as? [CGColor])?.compactMap {
                ROMColor(cgColor: $0)
            }).valueOrEmpty
        }
        set {
            self.gradientLayer.colors = newValue.map {
                $0.cgColor
            }
        }
    }
    
    /**
     Get/set the locations that used as the gradient stops by the underlying `CAGradientLayer`.
     
     - Warning: The locations must be in the range of `0.0 <= 1.0` **AND** monotonically increasing
     */
    open var locations: [Float] {
        get {
            (self.gradientLayer.locations?.map {
                $0.floatValue
            }).valueOrEmpty
        }
        set {
            self.gradientLayer.locations = newValue.nilIfEmpty?.map {
                NSNumber(value: $0)
            }
        }
    }
    
    /**
     Get/set the start point of the underlying `CAGradientLayer`.
     
     - Warning: The point is defined in the unit coordinate space
     */
    open var startPoint: ROMPoint {
        get {
            #if os(macOS)
            NSPointFromCGPoint(self.gradientLayer.startPoint)
            #else
            self.gradientLayer.startPoint
            #endif
        }
        set {
            #if os(macOS)
            self.gradientLayer.startPoint = NSPointToCGPoint(newValue)
            #else
            self.gradientLayer.startPoint = newValue
            #endif
        }
    }
    
    /**
     Get/set the end point of the underlying `CAGradientLayer`.
     
     - Warning: The point is defined in the unit coordinate space
     */
    open var endPoint: ROMPoint {
        get {
            #if os(macOS)
            NSPointFromCGPoint(self.gradientLayer.endPoint)
            #else
            self.gradientLayer.endPoint
            #endif
        }
        set {
            #if os(macOS)
            self.gradientLayer.endPoint = NSPointToCGPoint(newValue)
            #else
            self.gradientLayer.endPoint = newValue
            #endif
        }
    }
    
    // MARK: - Override Properties
    #if os(iOS) || os(tvOS)
    @_documentation(visibility: internal)
    open override class var layerClass: AnyClass {
        CAGradientLayer.self
    }
    #endif
    
    // MARK: - Private Properties
    private var gradientLayer: CAGradientLayer {
        self.layer as! CAGradientLayer
    }
    
    // MARK: - Public Functions
    /**
     Performs common setup during initialization.
     */
    open func setup() {
        #if os(macOS)
        self.wantsLayer = true
        self.layer = CAGradientLayer()
        #else
        self.backgroundColor = .clear
        #endif
    }
    
    // MARK: - Initializers
    @_documentation(visibility: internal)
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    @_documentation(visibility: internal)
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setup()
    }
}
#endif
