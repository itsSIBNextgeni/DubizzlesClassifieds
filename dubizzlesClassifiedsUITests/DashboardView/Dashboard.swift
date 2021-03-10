//
//  Dashboard.swift
//  DubizzlesClassifiedsTests
//
//  Created by Shahzaib Iqbal Bhatti on 3/10/21.
//

import XCTest
@testable import DubizzlesClassifieds

class Dashboard: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        launchApp()
        
        let collectionViewsQuery = app.collectionViews
        
        XCTAssert(collectionViewsQuery.children(matching: .cell).element(boundBy: 0).waitForExistence(timeout: 15), "Unable to find Cells screen")
        
       
        collectionViewsQuery.children(matching: .cell).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        app.navigationBars["Notebook"].buttons["Back"].tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 5).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        app.navigationBars["Hat"].buttons["Back"].tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 6).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        app.navigationBars["Sunglass"].buttons["Back"].tap()
        collectionViewsQuery.children(matching: .cell).element(boundBy: 2).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()
        app.navigationBars["Monitor"].buttons["Back"].tap()
                
       
    }

    fileprivate func launchApp() {
        app.launchArguments.append("Test")
        app.launch()
    }
}
