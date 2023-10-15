//
//  UIStackView+Extensions.swift
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

public extension UIStackView {
    // MARK: - Public Functions
    /**
     Adds the provided `subviews` as arranged subviews of the receiver.
     
     - Parameter subviews: The subviews to add as arranged subviews
     */
    func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach {
            self.addArrangedSubview($0)
        }
    }
}
#endif
