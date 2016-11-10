//
//  NameItem.swift
//  DiagnosticsApp
//
//  Created by Harold Hernandez on 11/10/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit
import DiagnosticsCore

class NameItem: RowItem {
    var identifierRow = ""
    var title: String
    var placeHolder: String
    var value: String?

    init(identifier: String, title: String, placeHolder: String, value: String?) {
        self.identifierRow = identifier
        self.title = title
        self.placeHolder = placeHolder
        self.value = value
    }

    var cellIdentifier: String {
        return LabelEditTableViewCell.identifierKey
    }

    func prepareCell(cell: UITableViewCell, tableView:UITableView) {
        let detailCell = cell as! LabelEditTableViewCell
        detailCell.titleLabel.text = self.title
        detailCell.valueTextField.text = self.value
        detailCell.valueTextField.placeholder = self.placeHolder
    }

    var identifier: String {
        return self.identifierRow
    }
}
