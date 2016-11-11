//
//  AnswerModel.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/10/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit
import RealmSwift

public class AnswerModel: Object {
    public dynamic var question: QuestionModel?
    public dynamic var value: Bool = false
}
