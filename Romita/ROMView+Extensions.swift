//
//  ROMView+Extensions.swift
//  Romita
//
//  Created by William Towe on 10/15/23.
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
#elseif os(macOS)
import AppKit
#endif

#if os(iOS) || os(tvOS) || os(macOS)
public extension ROMView {
    // MARK: - Public Functions
    /**
     Returns a set of layout constraints that will pin the receiver to `edges` and/or `safeAreaLayoutGuideEdges` of its superview with `edgeInsets`, the provided `priority`, and optionally `activate` the constraints before returning.
     
     - Parameter edges: The edges to pin to, the default is `NSDirectionalRectEdge.all`
     - Parameter safeAreaLayoutGuideEdges: The safe area layout guide edges to pin to, takes priority over `edges`
     - Parameter edgeInsets: The edge insets to inset the receiver from the edges of its superview
     - Parameter priority: The layout constraint priority to apply to the returned constraints, the default is `ROMLayoutConstraintPriority.required - 1.0`
     - Parameter activate: Whether to activate the layout constraints before returning them
     - Returns: The layout constraints
     */
    @discardableResult
    func pinToSuperviewEdges(_ edges: NSDirectionalRectEdge = .all, safeAreaLayoutGuideEdges: NSDirectionalRectEdge = [], edgeInsets: NSDirectionalEdgeInsets? = nil, priority: ROMLayoutConstraintPriority = .required - 1.0, activate: Bool = true) -> [NSLayoutConstraint] {
        guard let superview = self.superview else {
            fatalError("superview cannot be nil")
        }
        var retval = [NSLayoutConstraint]()
        
        if let edgeInsets = edgeInsets {
            if safeAreaLayoutGuideEdges.contains(.top) {
                retval.append(self.topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor, constant: edgeInsets.top))
            }
            else if edges.contains(.top) {
                retval.append(self.topAnchor.constraint(equalTo: superview.topAnchor, constant: edgeInsets.top))
            }
            
            if safeAreaLayoutGuideEdges.contains(.leading) {
                retval.append(self.leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor, constant: edgeInsets.leading))
            }
            else if edges.contains(.leading) {
                retval.append(self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: edgeInsets.leading))
            }
            
            if safeAreaLayoutGuideEdges.contains(.bottom) {
                retval.append(superview.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: edgeInsets.bottom))
            }
            else if edges.contains(.bottom) {
                retval.append(superview.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: edgeInsets.bottom))
            }
            
            if safeAreaLayoutGuideEdges.contains(.trailing) {
                retval.append(superview.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: edgeInsets.trailing))
            }
            else if edges.contains(.trailing) {
                retval.append(superview.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: edgeInsets.trailing))
            }
        }
        else {
            if safeAreaLayoutGuideEdges.contains(.top) {
                retval.append(self.topAnchor.constraint(equalToSystemSpacingBelow: superview.safeAreaLayoutGuide.topAnchor, multiplier: 1.0))
            }
            else if edges.contains(.top) {
                retval.append(self.topAnchor.constraint(equalToSystemSpacingBelow: superview.topAnchor, multiplier: 1.0))
            }
            
            if safeAreaLayoutGuideEdges.contains(.leading) {
                retval.append(self.leadingAnchor.constraint(equalToSystemSpacingAfter: superview.safeAreaLayoutGuide.leadingAnchor, multiplier: 1.0))
            }
            else if edges.contains(.leading) {
                retval.append(self.leadingAnchor.constraint(equalToSystemSpacingAfter: superview.leadingAnchor, multiplier: 1.0))
            }
            
            if safeAreaLayoutGuideEdges.contains(.bottom) {
                retval.append(superview.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: self.bottomAnchor, multiplier: 1.0))
            }
            else if edges.contains(.bottom) {
                retval.append(superview.bottomAnchor.constraint(equalToSystemSpacingBelow: self.bottomAnchor, multiplier: 1.0))
            }
            
            if safeAreaLayoutGuideEdges.contains(.trailing) {
                retval.append(superview.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: self.trailingAnchor, multiplier: 1.0))
            }
            else if edges.contains(.trailing) {
                retval.append(superview.trailingAnchor.constraint(equalToSystemSpacingAfter: self.trailingAnchor, multiplier: 1.0))
            }
        }
        
        retval.forEach {
            $0.priority = priority
        }
        
        if activate {
            NSLayoutConstraint.activate(retval)
        }
        
        return retval
    }
    
    // MARK: -
    /**
     Sets the receiver's `translatesAutoresizingMaskIntoConstraints` property to `value` and returns the receiver.
     
     - Parameter value: The desired `translatesAutoresizingMaskIntoConstraints` value
     - Returns: The receiver
     - SeeAlso: https://en.wikipedia.org/wiki/Builder_pattern
     */
    func setTranslatesAutoresizingMaskIntoConstraints(_ value: Bool = false) -> Self {
        self.translatesAutoresizingMaskIntoConstraints = value
        return self
    }
}
#endif
