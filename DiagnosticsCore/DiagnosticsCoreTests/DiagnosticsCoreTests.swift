//
//  DiagnosticsCoreTests.swift
//  DiagnosticsCoreTests
//
//  Created by Harold Hernandez on 11/9/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import XCTest
@testable import DiagnosticsCore

class DiagnosticsCoreTests: XCTestCase {

    /*!
     * @brief Check correct likelihood evaulating all answer true == 100%
     */
    func testDiagnosticFullLikelihood() {
        var toddSyndromeDisease = ToddSyndromeDisease()

        var answers = [Answer]()
        toddSyndromeDisease.factors.map({$0.questions}).map({$0}).forEach { (question) in
            answers.append(Answer(question: question, value: true))
        }

        let diagnostic = toddSyndromeDisease.diagnose(answers: answers)

        XCTAssertEqual(diagnostic.likelihood, 100)
    }

    /*!
     * @brief Check correct likelihood evaulating mid answer true and mid in false for 50%.
     */
    func testDiagnosticIncompleteLikelihood() {

        var toddSyndromeDisease = ToddSyndromeDisease()

        var answers = [Answer]()
        toddSyndromeDisease.factors.map({$0.questions}).map({$0}).forEach { (question) in
            answers.append(Answer(question: question, value: true))
        }

        answers[0].value = false
        answers[1].value = false

        let diagnostic = toddSyndromeDisease.diagnose(answers: answers)

        XCTAssertEqual(diagnostic.likelihood, 50)
    }
}
