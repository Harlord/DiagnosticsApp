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
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    /*!
     * @brief Check correct match evaulating riskFactorEvaluator.
     */
    func testMatch() {
        let question = Question(prompt: "You are a woman?",
        description: "There are more documented cases of men having it than woman",
        riskFactorEvaluator: true)

        let answerTrue = Answer(question: question, answer: true)

        let answerFalse = Answer(question: question, answer: false)

        if answerTrue.match() == true &&
            answerFalse.match() == false {
             XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }

    /*!
     * @brief Check correct likelihood evaulating all answer true == 100% and mid answer true and mid in false for 50%.
     */
    func testDiagnostic() {
        let question = Question(prompt: "You are a woman?",
                                description: "There are more documented cases of men having it than woman",
                                riskFactorEvaluator: true)

        let answerTrue1 = Answer(question: question, answer: true)
        let answerTrue2 = Answer(question: question, answer: true)

        let patient1 = Patient(name: "test", answers: [answerTrue1, answerTrue2])
        let diagnostic1 = Diagnostic(patient: patient1)

        let answerfalse1 = Answer(question: question, answer: false)

        let patient2 = Patient(name: "test", answers: [answerTrue1, answerfalse1])
        let diagnostic2 = Diagnostic(patient: patient2)

        if diagnostic1.likelihood == 100 &&
            diagnostic2.likelihood == 50 {
            XCTAssert(true)
        } else {
            XCTAssert(false)
        }
    }

    
}
