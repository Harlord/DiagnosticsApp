//
//  SectionItem.swift
//  DiagnosticsApp
//
//  Created by Harold Hernandez on 11/9/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit

struct SectionItem {
    var title: String
    var rows: [RowItem]

    public init(title: String) {
        self.init(title: title, rows:[RowItem]())
    }

    public init(title: String, rows: [RowItem]) {
        self.title = title
        self.rows = rows
    }
}
