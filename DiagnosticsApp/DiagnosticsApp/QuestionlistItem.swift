//
//  QuestionlistItem.swift
//  DiagnosticsApp
//
//  Created by Harold Hernandez on 11/9/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit
import DiagnosticsCore

class QuestionlistItem: RowItem {
    var title: String
    var detail: String

    init(title: String, detail: String) {
        self.title = title
        self.detail = detail
    }

    var cellIdentifier: String {
        return TitleResultTableViewCell.identifierKey
    }

    func prepareCell(cell: UITableViewCell, tableView: UITableView) {
        let detailCell = cell as! TitleResultTableViewCell
        detailCell.tagLabel.text = "Likelihood: "
        detailCell.titleLabel.text = self.title
        detailCell.resultlabel.text = self.detail
    }

    var identifier: String {
        return self.title
    }
}
