//
//  ProductListUITests.swift
//  ProductListUITests
//
//  Created by Rex Jason Alobba on 17/3/21.
//

import XCTest

class ProductListUITests: XCTestCase {
    let app = XCUIApplication()
  
    override func setUpWithError() throws {
        continueAfterFailure = false
        XCUIDevice.shared.orientation = UIDeviceOrientation.portrait
    }

    override func tearDownWithError() throws {
        
    }

  func testProductListScreen() {
    app.launch()
    XCTAssertTrue(app.navigationBars["Commbank Products"].staticTexts["Commbank Products"].exists)
  }
  
  func testProductListToProductDetail() {
    app.launch()
    let collectionViewsQuery = app.collectionViews
    collectionViewsQuery/*@START_MENU_TOKEN@*/.staticTexts["Smart Access"]/*[[".cells.staticTexts[\"Smart Access\"]",".staticTexts[\"Smart Access\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    
    let commbankProductsButton = app.navigationBars["ProductList.ProductDetailView"].buttons["Commbank Products"]
    XCTAssertTrue(commbankProductsButton.exists)
    XCTAssertTrue(app.staticTexts["Smart Access"].exists)
  }
}
