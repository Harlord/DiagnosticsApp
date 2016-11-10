//
//  Answer.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/9/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit

public struct Answer: Factor{
    public var question: Question
    public var answer: Bool

    public init(question: Question,
        answer: Bool) {
        self.question = question
        self.answer = answer
    }

    public func match() -> Bool {
        return question.riskFactorEvaluator == answer
    }
}
