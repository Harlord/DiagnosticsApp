//
//  TitleResultTableViewCell.swift
//  DiagnosticsApp
//
//  Created by Harold Hernandez on 11/9/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit

class TitleResultTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!
    @IBOutlet weak var resultlabel: UILabel!
    static let identifierKey = "title_result"

    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
