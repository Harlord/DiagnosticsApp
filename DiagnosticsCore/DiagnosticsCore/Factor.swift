//
//  Factor.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/9/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import Foundation

public protocol Factor {
    var title: String { get }
    var questions: Question { get }
    func maches(answers: [Answer]) -> Bool
}
