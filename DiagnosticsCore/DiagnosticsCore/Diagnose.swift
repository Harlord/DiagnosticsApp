//
//  QuestionEntity.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/10/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit
import RealmSwift

public class Diagnose: Object {
    public dynamic var title: String = ""
    public dynamic var detail: String = ""
}
