//
//  UIApplication+Extensions.swift
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

public extension UIApplication {
    // MARK: - Public Properties
    /**
     Returns whether the receiver is backgrounded.
     
     - Note: This will always execute on the main thread
     */
    var isBackgrounded: Bool {
        var retval: Bool!
        
        if Thread.isMainThread {
            retval = self.applicationState == .background
        }
        else {
            DispatchQueue.main.sync {
                retval = self.applicationState == .background
            }
        }
        
        return retval
    }
    
    // MARK: - Public Functions
    /**
     Open the application specific settings in the *Settings* app.
     
     - Parameter options: The options dictionary to pass to `UIApplication.open(_:options:completionHandler:)`
     - Parameter completion: The completion handler to pass to `UIApplication.open(_:options:completionHandler:)`
     - SeeAlso: https://developer.apple.com/documentation/uikit/uiapplication/1648685-open
     */
    func openSettings(options: [UIApplication.OpenExternalURLOptionsKey: Any] = [:], completion: ((Bool) -> Void)? = nil) {
        guard let url = URL(string: Self.openSettingsURLString), self.canOpenURL(url) else {
            completion?(false)
            return
        }
        self.open(url, options: options, completionHandler: completion)
    }
}
#endif
