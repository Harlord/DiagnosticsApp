//
//  LabelEditTableViewCell.swift
//  DiagnosticsApp
//
//  Created by Harold Hernandez on 11/10/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit

class LabelEditTableViewCell: UITableViewCell {
    static let identifierKey = "label_edit"
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var valueTextField: UITextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        valueTextField.clearButtonMode = .never
    }
}
