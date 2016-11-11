//
//  Questionmodel.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/10/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit
import RealmSwift

public class QuestionModel: Object {
    public dynamic var identifier: String = ""
    public dynamic var prompt: String = ""
}
