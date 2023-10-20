//
//  NSTableView+Extensions.swift
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

import Foundation
#if os(macOS)
import AppKit

public extension NSTableView {
    // MARK: - Public Functions
    /**
     Returns a view of class `class` for `tableColumn` and `owner`.
     
     - Parameter class: The view class to make
     - Parameter tableColumn: The related table column
     - Parameter owner: The owner object
     - Returns: The view instance
     */
    func makeViewClass<T: NSView>(_ class: T.Type, forTableColumn tableColumn: NSTableColumn?, owner: Any? = nil) -> T {
        self.makeViewClass(`class`, withIdentifier: tableColumn?.identifier ?? .init(T.defaultReuseIdentifier), owner: owner)
    }
    
    /**
     Returns a view of class `class` with `identifier` and `owner`.
     
     - Parameter class: The view class to make
     - Parameter identifier: The view identifier
     - Parameter owner: The owner object
     - Returns: The view instance
     */
    func makeViewClass<T: NSView>(_ class: T.Type, withIdentifier identifier: NSUserInterfaceItemIdentifier = .init(T.defaultReuseIdentifier), owner: Any? = nil) -> T {
        (self.makeView(withIdentifier: identifier, owner: owner) as? T) ?? T()
    }
}
#endif
