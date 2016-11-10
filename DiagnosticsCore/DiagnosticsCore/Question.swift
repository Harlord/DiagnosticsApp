//
//  Question.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/9/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import UIKit

public struct Question {
    public var prompt: String
    public var description: String
    public var riskFactorEvaluator: Bool

    public init(prompt: String, description: String, riskFactorEvaluator: Bool) {
        self.prompt = prompt
        self.description = description
        self.riskFactorEvaluator = riskFactorEvaluator
    }
}
