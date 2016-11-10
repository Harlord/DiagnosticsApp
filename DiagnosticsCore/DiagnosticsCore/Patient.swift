//
//  Patient.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/9/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit

public struct Patient {
    public var name: String
    public var answers: [Answer]

    public init(name: String, answers: [Answer]) {
        self.name = name
        self.answers = answers
    }
}
