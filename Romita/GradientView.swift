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
open class GradientView: ROMView {
    // MARK: - Public Properties
    open var colors: [ROMColor] {
        get {
            ((self.layer.colors as? [CGColor])?.map {
                ROMColor(cgColor: $0)
            }).valueOrEmpty
        }
        set {
            self.layer.colors = newValue.map {
                $0.cgColor
            }
        }
    }
    
    open var locations: [Float] {
        get {
            (self.layer.locations?.map {
                $0.floatValue
            }).valueOrEmpty
        }
        set {
            self.layer.locations = newValue.nilIfEmpty?.map {
                NSNumber(value: $0)
            }
        }
    }
    
    open var startPoint: ROMPoint {
        get {
            #if os(macOS)
            NSPointFromCGPoint(self.layer.startPoint)
            #else
            self.layer.startPoint
            #endif
        }
        set {
            #if os(macOS)
            self.layer.startPoint = NSPointToCGPoint(newValue)
            #else
            self.layer.startPoint = newValue
            #endif
        }
    }
    
    open var endPoint: ROMPoint {
        get {
            #if os(macOS)
            NSPointFromCGPoint(self.layer.startPoint)
            #else
            self.layer.startPoint
            #endif
        }
        set {
            #if os(macOS)
            self.layer.startPoint = NSPointToCGPoint(newValue)
            #else
            self.layer.startPoint = newValue
            #endif
        }
    }
    
    open func setup() {
        #if os(macOS)
        self.wantsLayer = true
        self.layer = CAGradientLayer()
        #else
        self.backgroundColor = .clear
        #endif
    }
    
    open override class var layerClass: AnyClass {
        CAGradientLayer.self
    }
    
    open override var layer: CAGradientLayer {
        super.layer as! CAGradientLayer
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setup()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.setup()
    }
}
#endif
