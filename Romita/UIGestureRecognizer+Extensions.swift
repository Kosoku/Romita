//
//  UIGestureRecognizer+Extensions.swift
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
#if os(iOS) || os(tvOS)
import UIKit

private final class UIGestureRecognizerBlockWrapper: NSObject {
    // MARK: - Public Properties
    let block: UIGestureRecognizer.Block
    weak var gestureRecognizer: UIGestureRecognizer?
    
    // MARK: - Private Functions
    @objc
    private func gestureRecognizerAction(sender: UIGestureRecognizer) {
        self.block(sender)
    }
    
    // MARK: - Initializers
    init(block: @escaping UIGestureRecognizer.Block, gestureRecognizer: UIGestureRecognizer) {
        self.block = block
        self.gestureRecognizer = gestureRecognizer
        
        super.init()
        
        gestureRecognizer.addTarget(self, action: #selector(gestureRecognizerAction(sender:)))
    }
    
    deinit {
        self.gestureRecognizer?.removeTarget(self, action: #selector(gestureRecognizerAction(sender:)))
    }
}

public extension UIGestureRecognizer {
    // MARK: - Public Types
    /**
     Block that is invoked when the gesture recognizer is triggered.
     */
    typealias Block = (UIGestureRecognizer) -> Void
    
    // MARK: - Public Properties
    /**
     Returns whether the receiver has any blocks associated with it.
     */
    var hasBlocks: Bool {
        self.gestureRecognizerBlockWrappers.isNotEmpty
    }
    
    // MARK: - Private Properties
    private static var gestureRecognizerBlockWrappersKey = 0
    private var gestureRecognizerBlockWrappers: Set<UIGestureRecognizerBlockWrapper> {
        get {
            (objc_getAssociatedObject(self, &Self.gestureRecognizerBlockWrappersKey) as? Set<UIGestureRecognizerBlockWrapper>).valueOrEmpty
        }
        set {
            objc_setAssociatedObject(self, &Self.gestureRecognizerBlockWrappersKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    // MARK: - Public Functions
    /**
     Adds the provided `block` to set of blocks that are invoked when the receiver is triggered and returns the receiver.
     
     - Parameter block: The block to add
     - Returns: The receiver
     */
    @discardableResult
    func addBlock(_ block: @escaping Block) -> Self {
        self.gestureRecognizerBlockWrappers = self.gestureRecognizerBlockWrappers.also {
            $0.insert(.init(block: block, gestureRecognizer: self))
        }
        return self
    }
    
    /**
     Removes all blocks associated with the receiver.
     */
    func removeAllBlocks() {
        self.gestureRecognizerBlockWrappers = self.gestureRecognizerBlockWrappers.also {
            $0.removeAll()
        }
    }
}
#endif
