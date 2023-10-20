//
//  NSControlExtensionsViewController.swift
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
import Feige
import Foundation
import os.log
import Romita

final class NSControlExtensionsViewController: NSViewController {
    private let stackView = NSStackView()
        .setTranslatesAutoresizingMaskIntoConstraints()
        .also {
            $0.orientation = .vertical
            $0.alignment = .centerX
        }
    private let button = NSButton()
        .setTranslatesAutoresizingMaskIntoConstraints()
        .also {
            $0.title = "Block"
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = ViewModel.Item.nsControlExtensions.title
        self.view.addSubview(self.stackView.also {
            $0.addArrangedSubview(self.button.also {
                $0.block = { _ in
                    os_log("Block action", log: .viewController)
                }
            })
        })
        self.stackView.pinToSuperviewEdges([.leading, .top, .trailing])
    }
}
