//
//  ViewController.swift
//  Demo-macOS
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

import Cocoa
import Combine
import Feige
import Romita

class ViewController: NSViewController, NSTableViewDelegate {
    // MARK: - Private Types
    private typealias DiffableDataSource = NSTableViewDiffableDataSource<ViewModel.Section, ViewModel.Item>
    
    // MARK: - Private Properties
    @IBOutlet
    private weak var tableView: NSTableView?
    
    private lazy var diffableDataSource: DiffableDataSource = { [unowned self] in
        DiffableDataSource(tableView: self.tableView!) { tableView, tableColumn, row, item in
            tableView.makeViewClass(NSTableCellView.self, forTableColumn: tableColumn)
                .also {
                    $0.textField?.stringValue = item.title
                }
        }
    }()
    
    private let viewModel = ViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView?.dataSource = self.diffableDataSource
        self.tableView?.delegate = self
        
        self.viewModel.$snapshot
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self else {
                    return
                }
                self.diffableDataSource.apply($0, animatingDifferences: true)
            }
            .store(in: &self.cancellables)
    }
    
    // MARK: - NSTableViewDelegate
    func tableViewSelectionDidChange(_ notification: Notification) {
        guard let row = self.tableView?.selectedRow, let item = self.diffableDataSource.itemIdentifier(forRow: row) else {
            return
        }
        if let viewController = item.viewControllerForPresenting {
            self.presentAsModalWindow(viewController)
        }
    }
}

