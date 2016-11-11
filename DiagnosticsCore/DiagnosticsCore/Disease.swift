//
//  Disease.swift
//  DiagnosticsCore
//
//  Created by Harold Hernandez on 11/10/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import Foundation

public class Disease {
    public var factors = [Factor]()

    var questions: [Question] {
        return factors.map({$0.questions}).map({$0})
    }

    public func diagnose(answers: [Answer]) -> Diagnostic {
        var matches = [Match]()
        for factor in factors {
            if factor.maches(answers: answers) {
                matches.append(Match(factor: factor))
            }
        }

        let quantity = Double(factors.count)
        let likelihood = Double(matches.count * 100) / quantity
        let diagnostic = Diagnostic(matches: matches, likelihood: likelihood)
        return diagnostic
    }
}
