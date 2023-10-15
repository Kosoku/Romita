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
    func registerCellClass<T: UITableViewCell>(_ class: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func registerHeaderFooterViewClass<T: UITableViewHeaderFooterView>(_ class: T.Type) {
        self.register(T.self, forHeaderFooterViewReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCellClass<T: UITableViewCell>(_ class: T.Type, for indexPath: IndexPath) -> T {
        guard let retval = self.dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue cell with identifier \(T.defaultReuseIdentifier)")
        }
        return retval
    }
    
    func dequeueReusableHeaderFooterViewClass<T: UITableViewHeaderFooterView>(_ class: T.Type) -> T {
        guard let retval = self.dequeueReusableHeaderFooterView(withIdentifier: T.defaultReuseIdentifier) as? T else {
            fatalError("Unable to dequeue header footer view with identifier \(T.defaultReuseIdentifier)")
        }
        return retval
    }
}
#endif
