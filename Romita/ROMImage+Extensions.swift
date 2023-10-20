//
//  ROMImage+Extensions.swift
//  Romita
//
//  Created by William Towe on 10/20/23.
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
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(macOS)
import AppKit
#endif

#if os(iOS) || os(tvOS) || os(macOS) || os(tvOS)
public extension ROMImage {
    // MARK: - Public Functions
    /**
     Returns a new image that will **never** act as a template.
     */
    func original() -> ROMImage {
        #if os(iOS) || os(tvOS) || os(tvOS)
        self.withRenderingMode(.alwaysOriginal)
        #else
        guard self.isTemplate else {
            return self
        }
        guard let retval = self.copy() as? ROMImage else {
            fatalError("Unable to copy existing image \(self)")
        }
        return retval.also {
            $0.isTemplate = false
        }
        #endif
    }
    
    /**
     Returns a new image that will **always** act as a template.
     */
    func template() -> ROMImage {
        #if os(iOS) || os(tvOS) || os(tvOS)
        self.withRenderingMode(.alwaysTemplate)
        #else
        guard self.isTemplate.not() else {
            return self
        }
        guard let retval = self.copy() as? ROMImage else {
            fatalError("Unable to copy existing image \(self)")
        }
        return retval.also {
            $0.isTemplate = true
        }
        #endif
    }
}
#endif
