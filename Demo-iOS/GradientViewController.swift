//
//  GradientViewController.swift
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

import Foundation
import Romita
import UIKit

final class GradientViewController: UIViewController {
    // MARK: - Private Properties
    private let gradientView = GradientView()
        .setTranslatesAutoresizingMaskIntoConstraints()
        .also {
            $0.colors = [
                .random(),
                .random()
            ]
        }
    
    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = ViewModel.Item.gradientView.title
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(self.gradientView)
        self.gradientView.pinToSuperviewEdges(safeAreaLayoutGuideEdges: .all, edgeInsets: .zero)
    }
}
