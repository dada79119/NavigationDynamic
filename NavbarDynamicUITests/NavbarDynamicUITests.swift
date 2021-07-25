//
//  NavbarDynamicUITests.swift
//  NavbarDynamicUITests
//
//  Created by dada on 2021/7/24.
//

import XCTest

class NavbarDynamicUITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        // Get a handle for the tableView
        let tableview = app.tables["tableview"]

        // Swipe down until it is visible
        var count: Int = 0
        var upAction: Bool = true
        var downAction: Bool = true
        if !tableview.exists{
            while upAction {
                count += 1
                app.swipeUp()
                upAction = count <= 10
            }
            count = 0
            while downAction {
                count += 1
                app.swipeDown()
                downAction = count <= 6
            }
        }
       

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
