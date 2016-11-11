//
//  Question.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/9/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import Foundation

public struct Question: Equatable {
    public var identifier: String
    public var prompt: String

    public init(identifier: String, prompt: String) {
        self.identifier = identifier
        self.prompt = prompt
    }
}

public func ==(lhs: Question, rhs: Question) -> Bool {
    return lhs.identifier == rhs.identifier
}
