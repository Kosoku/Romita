//
//  UIViewController+Extensions.swift
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
#if os(iOS) || os(tvOS)
import UIKit

public extension UIViewController {
    // MARK: - Public Properties
    /**
     Returns the view controller that should be used when calling `UIViewController.present(_:animated:)`, starting from the first window scene's key window's root view controller.
     */
    static var viewControllerForPresenting: UIViewController? {
        for case let windowScene as UIWindowScene in UIApplication.shared.connectedScenes {
            for case let window in windowScene.windows where window.isKeyWindow {
                return window.rootViewController?.viewControllerForPresenting
            }
        }
        return nil
    }
    
    /**
     Returns the view controller that should be used when calling `UIViewController.present(_:animated:)`.
     */
    var viewControllerForPresenting: UIViewController? {
        var retval: UIViewController? = self
        
        while retval?.presentedViewController != nil {
            retval = retval?.presentedViewController
        }
        
        return retval
    }
}
#endif
