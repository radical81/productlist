//
//  ProductListTests.swift
//  ProductListTests
//
//  Created by Rex Jason Alobba on 17/3/21.
//

import XCTest
@testable import ProductList

class ProductListTests: XCTestCase {
  
    override func setUpWithError() throws {
      
    }

    override func tearDownWithError() throws {
      
    }
  
  func testApiServiceFetchDataMock() {
    let data = Data([0, 1, 0, 1])
    let session = MockSession() // It's deprecated, I know. No alternative solution at this point.
    session.data = data
    let api = ApiService(session: session)
    
    api.fetchData(endpoint: "https://localhost", completion: { dataResult, response, error in
      if error != nil {
        XCTFail()
      }
      XCTAssertEqual(data, dataResult)
      return
    })
  }
}
