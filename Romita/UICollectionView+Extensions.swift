//
//  UICollectionView+Extensions.swift
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

public extension UICollectionView {
    // MARK: - Public Functions
    /**
     Registers the provided cell `class` for reuse.
     
     - Parameter class: The cell class to register
     - SeeAlso: `UICollectionView.dequeueReusableCellClass(_:for:)`
     */
    func registerCellClass<T: UICollectionViewCell>(_ class: T.Type) {
        self.register(T.self, forCellWithReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    /**
     Registers the provided supplementary view `class` for reuse.
     
     - Parameter class: The supplementary view class to register
     - Parameter kind: The view kind, defaults to `T.defaultReuseIdentifier`
     */
    func registerSupplementaryViewClass<T: UICollectionReusableView>(_ class: T.Type, kind: String = T.defaultReuseIdentifier) {
        self.register(T.self, forSupplementaryViewOfKind: kind, withReuseIdentifier: T.defaultReuseIdentifier)
    }
    
    /**
     Dequeues a reusable cell of the provided `class`.
     
     - Parameter class: The cell class to dequeue
     - Parameter indexPath: The provided index path
     - Returns: The reusable cell
     */
    func dequeueReusableCellClass<T: UICollectionViewCell>(_ class: T.Type, for indexPath: IndexPath) -> T {
        guard let retval = self.dequeueReusableCell(withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue cell with identifier \(T.defaultReuseIdentifier)")
        }
        return retval
    }
    
    /**
     Dequeues a reusable supplementary view of the provided `class`.
     
     - Parameter class: The supplementary view class to dequeue
     - Parameter kind: The view kind, defaults to `T.defaultReuseIdentifier`
     - Returns: The reusable supplementary view
     */
    func dequeueReusableSupplementaryViewClass<T: UICollectionReusableView>(_ class: T.Type, kind: String = T.defaultReuseIdentifier, for indexPath: IndexPath) -> T {
        guard let retval = self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Unable to dequeue supplementary view with identifier \(T.defaultReuseIdentifier) of kind \(kind)")
        }
        return retval
    }
}
#endif
