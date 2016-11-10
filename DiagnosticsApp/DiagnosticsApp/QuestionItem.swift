//
//  QuestionItem.swift
//  DiagnosticsApp
//
//  Created by Harold Hernandez on 11/9/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit
import DiagnosticsCore

class QuestionItem: RowItem {
    var identifierRow = ""
    var answer: Answer

    init(identifier: String, answer: Answer) {
        self.identifierRow = identifier
        self.answer = answer
    }

    var cellIdentifier: String {
        return TitleSwitchTableViewCell.identifierKey
    }

    func prepareCell(cell: UITableViewCell, tableView:UITableView) {
        let detailCell = cell as! TitleSwitchTableViewCell
        detailCell.titleLabel.text = self.answer.question.prompt
        detailCell.optionSwitch.isOn = self.answer.answer
    }
    var identifier: String {
        return self.identifierRow
    }
}
