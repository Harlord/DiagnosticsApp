//
//  FullFactor.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/10/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import Foundation

public class FullFactor: Factor {
    public private(set) var title: String
    public private(set) var questions: Question

    public init(title: String, questions: Question) {
        self.title = title
        self.questions = questions
    }

    public func maches(answers: [Answer]) -> Bool {
        return answers.filter {$0.value}.map {$0.question}.contains(questions)
    }
}
