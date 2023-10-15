//
//  ViewModel.swift
//  Demo-iOS
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

import Combine
import Feige
import Foundation
import UIKit

extension ViewModel.Snapshot: ScopeFunctions {}

final class ViewModel {
    // MARK: - Public Types
    enum Section: Hashable {
        case views
        
        // MARK: - Public Properties
        var title: String {
            switch self {
            case .views:
                return "Views"
            }
        }
    }
    enum Item: Hashable {
        case gradientView
        case shakeAnimation
        
        // MARK: - Public Properties
        var title: String {
            switch self {
            case .gradientView:
                return "GradientView"
            case .shakeAnimation:
                return "Shake Animation"
            }
        }
        
        var viewControllerForPushing: UIViewController? {
            switch self {
            case .gradientView:
                return GradientViewController()
            case .shakeAnimation:
                return ShakeAnimationViewController()
            }
        }
    }
    
    typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Item>
    
    // MARK: - Public Properties
    @Published
    private(set) var snapshot: Snapshot
    
    // MARK: - Initializers
    init() {
        self.snapshot = Snapshot().also {
            $0.appendSections([.views])
            $0.appendItems([.gradientView, .shakeAnimation], toSection: .views)
        }
    }
}
