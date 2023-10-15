//
//  UIView+Extensions.swift
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

import Feige
import Foundation
#if os(iOS) || os(tvOS)
import UIKit

public extension UIView {
    // MARK: - Public Properties
    /**
     Returns the default nib name for the receiver which is its class name.
     */
    static var defaultNibName: String {
        String(describing: self)
    }
    
    /**
     Returns the default reuse identifier for the receiver which is its class name.
     */
    static var defaultReuseIdentifier: String {
        String(describing: self)
    }
    
    // MARK: -
    /**
     Returns the first responder or nil if nothing is currently first responder.
     */
    var firstResponder: UIResponder? {
        guard self.isFirstResponder.not() else {
            return self
        }
        return self.recursiveSubviews.first {
            $0.isFirstResponder
        }
    }
    
    /**
     Returns a list of all the receiver's subviews, computed recursively.
     */
    var recursiveSubviews: [UIView] {
        var retval = [UIView]()
        
        for view in self.subviews {
            retval.append(view)
            retval.append(contentsOf: view.recursiveSubviews)
        }
        
        return retval
    }
    
    /**
     Returns the receiver's owning view controller or if it cannot be found.
     */
    var viewController: UIViewController? {
        switch self.next {
        case let retval as UIViewController:
            return retval
        case let next as UIView:
            return next.viewController
        default:
            return nil
        }
    }
    
    // MARK: - Private Properties
    private static let shakeAnimationKey = "com.kosoku.romita.shake-animation-key"
    
    // MARK: - Public Functions
    /**
     Adds the provided `subviews` to the receiver.
     
     - Parameter subviews: The list of subviews to add
     */
    func addSubviews(_ subviews: [UIView]) {
        for view in subviews {
            self.addSubview(view)
        }
    }
    
    /**
     Removes all the receiver's subviews.
     */
    func removeAllSubviews() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
    
    // MARK: -
    /**
     Starts a shake animation that will last `duration` seconds.
     
     - Parameter duration: The duration of the shake animation, defaults to `0.6` seconds
     - SeeAlso: `UIView.stopShakeAnimation()`
     */
    func startShakeAnimation(duration: CFTimeInterval = 0.6) {
        self.stopShakeAnimation()
        self.layer.add(CAKeyframeAnimation(keyPath: "transform.translation.x").also {
            $0.duration = duration
            $0.values = [
                -20,
                 20,
                 -20,
                 20,
                 -10,
                 10,
                 -5,
                 5,
                 0
            ]
        }, forKey: Self.shakeAnimationKey)
    }
    
    /**
     Stops any in progress shake animation.
     
     - SeeAlso: `UIView.startShakeAnimation(duration:)`
     */
    func stopShakeAnimation() {
        self.layer.removeAnimation(forKey: Self.shakeAnimationKey)
    }
    
    // MARK: -
    /**
     Returns the first view of `class` walking up the view hierarchy or nil if one cannot be found.
     
     - Parameter class: The view class to find
     - Returns: The view or nil
     */
    func viewOfClass<T: UIView>(_ class: T.Type) -> T? {
        var retval: UIView? = self
        
        while retval != nil {
            switch retval {
            case let retval as T:
                return retval
            default:
                retval = retval?.superview
            }
        }
        return nil
    }
}
#endif
