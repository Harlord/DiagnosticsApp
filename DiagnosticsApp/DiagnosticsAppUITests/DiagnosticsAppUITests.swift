//
//  DiagnosticsAppUITests.swift
//  DiagnosticsAppUITests
//
//  Created by Harold Hernandez on 11/9/16.
//  Copyright © 2016 PagedOrg. All rights reserved.
//

import XCTest

class DiagnosticsAppUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testUI() {
        XCUIApplication().navigationBars["Diagnostics"].buttons["Add"].tap()
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        let doYouFeelMigrainsSwitch = tablesQuery.switches["Do you feel migrains?"]
        doYouFeelMigrainsSwitch.tap()
        
        let patientNameTextField = tablesQuery.textFields["Patient Name"]
        patientNameTextField.tap()
        patientNameTextField.typeText("")
        tablesQuery.cells.containing(.staticText, identifier:"Name:").children(matching: .textField).element.typeText("test")
        tablesQuery.switches["Do you consume hallucinogenic drugs?"].tap()
        
        let youAreUnder15YearsOldSwitch = tablesQuery.switches["You are under 15 years old?"]
        youAreUnder15YearsOldSwitch.tap()
        
        let doneButton = app.navigationBars["Diagnosing"].buttons["Done"]
        doneButton.tap()
        app.navigationBars["Diagnostics"].buttons["Add"].tap()
        doYouFeelMigrainsSwitch.tap()
        youAreUnder15YearsOldSwitch.tap()
        doneButton.tap()
    }
    
}
