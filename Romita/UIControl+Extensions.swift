//
//  UIControl+Extensions.swift
//  Romita
//
//  Created by William Towe on 10/19/23.
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

private final class UIControlBlockWrapper: NSObject {
    // MARK: - Public Properties
    let block: UIControl.Block
    weak var control: UIControl?
    let controlEvents: UIControl.Event
    
    // MARK: - Private Functions
    @objc
    private func controlAction(sender: UIControl) {
        self.block(sender, self.controlEvents)
    }
    
    // MARK: - Initializers
    init(block: @escaping UIControl.Block, control: UIControl, controlEvents: UIControl.Event) {
        self.block = block
        self.control = control
        self.controlEvents = controlEvents
        
        super.init()
        
        control.addTarget(self, action: #selector(controlAction(sender:)), for: self.controlEvents)
    }
    
    deinit {
        self.control?.removeTarget(self, action: #selector(controlAction(sender:)), for: self.controlEvents)
    }
}

extension UIControl.Event: Hashable {
    // MARK: - Hashable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.rawValue)
    }
}

public extension UIControl {
    // MARK: - Public Types
    /**
     Block to invoke when control events are triggered.
     */
    typealias Block = (UIControl, UIControl.Event) -> Void
    
    // MARK: - Private Properties
    private static var controlEventsToControlBlockWrappersKey = 0
    private var controlEventsToControlBlockWrappers: [UIControl.Event: Set<UIControlBlockWrapper>] {
        get {
            (objc_getAssociatedObject(self, &Self.controlEventsToControlBlockWrappersKey) as? [UIControl.Event: Set<UIControlBlockWrapper>]).valueOrEmpty
        }
        set {
            objc_setAssociatedObject(self, &Self.controlEventsToControlBlockWrappersKey, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    // MARK: - Public Functions
    /**
     Returns whether the control has blocks associated with it for the provided `controlEvents`.
     
     - Parameter controlEvents: The control events to check for associated blocks
     - Returns: `true` if there are associated blocks, otherwise `false`
     */
    func hasBlocks(forControlEvents controlEvents: UIControl.Event) -> Bool {
        self.controlEventsToControlBlockWrappers[controlEvents].isNotNil
    }
    
    /**
     Add a `block` to be invoked when the provided `controlEvents` are triggered and returns the receiver.
     
     - Parameter controlEvents: The control events that should invoke `block`
     - Parameter block: The block to invoke when `controlEvents` are triggered
     - Returns: The receiver
     - SeeAlso: https://en.wikipedia.org/wiki/Builder_pattern
     */
    @discardableResult
    func addBlock(forControlEvents controlEvents: UIControl.Event = .touchUpInside, block: @escaping Block) -> Self {
        self.controlEventsToControlBlockWrappers = self.controlEventsToControlBlockWrappers.also {
            $0[controlEvents] = $0[controlEvents].valueOrEmpty.also {
                $0.insert(.init(block: block, control: self, controlEvents: controlEvents))
            }
        }
        return self
    }
    
    /**
     Remove all blocks for the provided `controlEvents`.
     
     - Parameter controlEvents: The control events for which all blocks should be removed
     */
    func removeBlocks(forControlEvents controlEvents: UIControl.Event) {
        self.controlEventsToControlBlockWrappers = self.controlEventsToControlBlockWrappers.also {
            $0[controlEvents] = nil
        }
    }
}
#endif
