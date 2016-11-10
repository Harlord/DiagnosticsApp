//
//  TitleSwitchTableViewCell.swift
//  DiagnosticsApp
//
//  Created by Harold Hernandez on 11/9/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit

class TitleSwitchTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var optionSwitch: UISwitch!
    static let identifierKey = "title_switch"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
