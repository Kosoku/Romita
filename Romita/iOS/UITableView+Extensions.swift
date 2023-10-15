//
//  UITableView+Extensions.swift
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

public extension UITableView {
    // MARK: - Public Functions
    /**
     Registers the provided cell `class` for reuse.
     
     - Parameter class: The cell class to register
     - SeeAlso: `UITableView.dequeueReusableCellClass(_:for:)`
     */
    func registerCellClass<T: UITableViewCell>(_ class: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    /**
     Registers the provided header footer view `class` for reuse.
     
     - Parameter class: The header footer view class to register
     - SeeAlso: `UITableView.dequeueReusableHeaderFooterViewClass(_:)`
     */
    func registerHeaderFooterViewClass<T: UITableViewHeaderFooterView>(_ class: T.Type) {
        self.register(T.self, forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    /**
     Dequeues a reusable cell of the provided `class`.
     
     - Parameter class: The cell class to dequeue
     - Parameter indexPath: The provided index path
     - Returns: The reusable cell
     */
    func dequeueReusableCellClass<T: UITableViewCell>(_ class: T.Type, for indexPath: IndexPath) -> T {
        guard let retval = self.dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue cell with identifier \(T.defaultReuseIdentifier)")
        }
        return retval
    }
    
    /**
     Dequeues a reusable header footer view of the provided `class`.
     
     - Parameter class: The header footer view class to dequeue
     - Returns: The reusable header footer view
     */
    func dequeueReusableHeaderFooterViewClass<T: UITableViewHeaderFooterView>(_ class: T.Type) -> T {
        guard let retval = self.dequeueReusableHeaderFooterView(withIdentifier: T.defaultReuseIdentifier) as? T else {
            fatalError("Unable to dequeue header footer view with identifier \(T.defaultReuseIdentifier)")
        }
        return retval
    }
}
#endif
