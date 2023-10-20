//
//  UIControlExtensionsViewController.swift
//  Demo-iOS
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
import os.log
import Romita
import UIKit

final class UIControlExtensionsViewController: UIViewController {
    // MARK: - Private Properties
    private let stackView = UIStackView()
        .setTranslatesAutoresizingMaskIntoConstraints()
        .also {
            $0.axis = .vertical
            $0.alignment = .center
        }
    private let button = UIButton(type: .system)
        .setTranslatesAutoresizingMaskIntoConstraints()
        .also {
            $0.setTitle("Block", for: .normal)
        }
    
    private let longPressGestureRecognizer = UILongPressGestureRecognizer()
    
    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = ViewModel.Item.uiControlExtensions.title
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(self.stackView.also {
            $0.addArrangedSubview(self.button.also {
                $0.addGestureRecognizer(self.longPressGestureRecognizer.also {
                    $0.addBlock {
                        guard $0.state == .began else {
                            return
                        }
                        os_log("Long press block", log: .viewController)
                    }
                })
                $0.addBlock { _, _ in
                    os_log("Button block", log: .viewController)
                }
            })
        })
        self.stackView.pinToSuperviewEdges([.leading, .trailing], safeAreaLayoutGuideEdges: .top)
    }
}
