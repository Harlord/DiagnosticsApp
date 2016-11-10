//
//  TableItem.swift
//  DiagnosticsApp
//
//  Created by Harold Hernandez on 11/9/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit

protocol RowItem {
    var cellIdentifier: String { get }
    func prepareCell(cell: UITableViewCell, tableView: UITableView)
    var identifier: String { get }
}
