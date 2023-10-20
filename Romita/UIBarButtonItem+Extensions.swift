//
//  UIBarButtonItem+Extensions.swift
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
import os.log
#if os(iOS) || os(tvOS)
import UIKit

public extension UIBarButtonItem {
    // MARK: - Public Types
    /**
     Block to invoke when a `UIBarButtonItem` is tapped.
     */
    typealias Block = (UIBarButtonItem) -> Void
    
    // MARK: - Public Properties
    /**
     Get/set the block associated with the receiver.
     
     - Warning: Setting this to `nil` will clear the receiver's `target` and `action`. Seting is to a non-nil value will overwrite the receiver's `target` and `action` values
     */
    var block: Block? {
        get {
            objc_getAssociatedObject(self, &Self.blockKey) as? Block
        }
        set {
            objc_setAssociatedObject(self, &Self.blockKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            
            guard newValue.isNotNil else {
                self.target = nil
                self.action = nil
                return
            }
            self.target = self
            self.action = #selector(blockAction(sender:))
        }
    }
    
    // MARK: - Private Properties
    private static var blockKey = 0
    
    // MARK: - Private Functions
    @objc
    private func blockAction(sender: UIBarButtonItem) {
        guard let block = sender.block else {
            return
        }
        block(sender)
    }
}
#endif
