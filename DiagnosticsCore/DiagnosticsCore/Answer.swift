//
//  Answer.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/9/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import Foundation

public class Answer {
    public var question: Question
    public var value: Bool

    public init(question: Question,
                value: Bool) {
        self.question = question
        self.value = value
    }
}
