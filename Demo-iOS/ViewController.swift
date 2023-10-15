//
//  ViewController.swift
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
import Romita
import UIKit

extension UIListContentConfiguration: ScopeFunctions {}

class ViewController: UITableViewController {
    // MARK: - Private Types
    private typealias DiffableDataSource = UITableViewDiffableDataSource<ViewModel.Section, ViewModel.Item>
    
    // MARK: - Private Properties
    private lazy var diffableDataSource: DiffableDataSource = { [unowned self] in
        DiffableDataSource(tableView: self.tableView) { tableView, indexPath, item in
            tableView.dequeueReusableCellClass(UITableViewCell.self, for: indexPath).also {
                $0.contentConfiguration = $0.defaultContentConfiguration().also {
                    $0.text = item.title
                }
            }
        }
    }()
    
    private let viewModel = ViewModel()
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - Override Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Romita"
        
        self.tableView.registerHeaderFooterViewClass(UITableViewHeaderFooterView.self)
        self.tableView.registerCellClass(UITableViewCell.self)
        self.tableView.dataSource = self.diffableDataSource
        
        self.viewModel.$snapshot
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in
                guard let self else {
                    return
                }
                self.diffableDataSource.apply($0)
            }
            .store(in: &self.cancellables)
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection sectionIndex: Int) -> UIView? {
        guard let section = self.diffableDataSource.sectionIdentifier(for: sectionIndex) else {
            return nil
        }
        return tableView.dequeueReusableHeaderFooterViewClass(UITableViewHeaderFooterView.self).also {
            $0.contentConfiguration = $0.defaultContentConfiguration().also {
                $0.text = section.title
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = self.diffableDataSource.itemIdentifier(for: indexPath) else {
            return
        }
        if let viewController = item.viewControllerForPushing {
            self.navigationController?.pushViewController(viewController, animated: true)
        }
    }
}

