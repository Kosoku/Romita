//
//  ViewModel.swift
//  Demo-macOS
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

import Cocoa
import Combine
import Foundation
import Feige
import Romita

extension ViewModel.Snapshot: ScopeFunctions {}

final class ViewModel {
    // MARK: - Public Types
    enum Section: Hashable {
        case extensions
        case views
        
        // MARK: - Public Properties
        var title: String {
            switch self {
            case .extensions:
                return "Extensions"
            case .views:
                return "Views"
            }
        }
    }
    enum Item: Hashable {
        case gradientView
        case nsControlExtensions
        
        // MARK: - Public Properties
        var title: String {
            switch self {
            case .gradientView:
                return "GradientView"
            case .nsControlExtensions:
                return "NSControl Extensions"
            }
        }
        
        var viewControllerForPresenting: NSViewController? {
            switch self {
            case .gradientView:
                return GradientViewController()
            case .nsControlExtensions:
                return NSControlExtensionsViewController()
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
            $0.appendSections([.extensions, .views])
            $0.appendItems([.nsControlExtensions], toSection: .extensions)
            $0.appendItems([.gradientView], toSection: .views)
        }
    }
}
