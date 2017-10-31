//
//  Bluepill_SampleUITests.swift
//  Bluepill-SampleUITests
//
//  Created by Yusuke on 2017/10/31.
//  Copyright © 2017 Yusuke. All rights reserved.
//

import XCTest

let app = XCUIApplication()

class Bluepill_SampleUITests: XCTestCase {
    
    let registerButton = app.buttons["registerButton"]
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app.launch()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testInvalidId() {
        
        inputForm(id:       "",
                  mail:     "foo@bar.com",
                  password: "password123")
        
        registerButton.tap()
        XCTAssertTrue(app.staticTexts["ID is required"].exists)
    }
    
    func testInvalidMail() {
        
        inputForm(id:       "apple",
                  mail:     "foobar.com",
                  password: "password123")
        
        registerButton.tap()
        XCTAssertTrue(app.staticTexts["Mail is invalid"].exists)
    }
    
    func testInvalidPassword() {
        
        inputForm(id:       "apple",
                  mail:     "foo@bar.com",
                  password: "pass")

        registerButton.tap()
        XCTAssertTrue(app.staticTexts["Password must be at least 8 characters long"].exists)
    }
    
    func testRegisterSuccess() {
        
        inputForm(id:       "apple",
                  mail:     "foo@bar.com",
                  password: "password123")

        registerButton.tap()
        XCTAssertTrue(app.staticTexts["Register success!!"].exists)
    }
    
    private func inputForm(id: String, mail: String, password: String) {
        
        let idText       = app.textFields["idText"]
        let mailText     = app.textFields["mailText"]
        let passwordText = app.textFields["passwordText"]
        
        idText.inputText(id)
        mailText.inputText(mail)
        passwordText.inputText(password)
    }
}

extension XCUIElement {
    func inputText(_ text: String) {
        tap()
        typeText(text)
    }
}
