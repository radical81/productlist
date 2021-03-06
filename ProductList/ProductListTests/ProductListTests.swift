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
  
  func testFetchProducts() {
    let products = [Product(productId: "ad22b1f0967349e8a5d586afe7f0d845", effectiveFrom: nil, effectiveTo: nil, lastUpdated: nil, productCategory: nil, name: nil, description: nil, brand: "CBA", brandName: nil, applicationUri: nil, isTailored: false, additionalInformation: nil),
                    Product(productId: "7aff9e0e85e6450eb052d4ff2e953223", effectiveFrom: "2011-05-10T04:00:00Z", effectiveTo: "9999-12-30T13:00:00Z", lastUpdated: nil, productCategory: nil, name: nil, description: nil, brand: nil, brandName: nil, applicationUri: nil, isTailored: nil, additionalInformation: nil)
        ]
    let links = Links(self: "/cds-au/v1/banking/products?page-size=2", first: "/cds-au/v1/banking/products?page-size=2&page=1", next: "/cds-au/v1/banking/products?page-size=2&page=2", last: "/cds-au/v1/banking/products?page-size=2&page=14")
    let meta = Meta(totalRecords: 28, totalPages: 14)
    
    if let path = Bundle(for: type(of: self)).path(forResource: "Products", ofType: "json") {
      do {
        let jsonStr = try String(contentsOfFile: path)
        if let jsonData = jsonStr.data(using: .utf8) {
          let mockApi = MockApiService()
          mockApi.data = jsonData
          mockApi.response = HTTPURLResponse(url: URL(string: "https://localhost")!, statusCode: 200, httpVersion: nil, headerFields: nil)
          let commbank = Commbank()
          commbank.api = mockApi
          commbank.queue = DispatchQueue.global()
          commbank.fetchProducts { response in
            XCTAssertEqual(products, response.data?.products)
            XCTAssertEqual(links, response.links)
            XCTAssertEqual(meta, response.meta)
          }
        }

      } catch {
        XCTFail()
      }
    }
  }
  
  func testFetchProductDetail() {
    let product = Product(productId: "ad22b1f0967349e8a5d586afe7f0d845", effectiveFrom: nil, effectiveTo: nil, lastUpdated: nil, productCategory: nil, name: nil, description: nil, brand: "CBA", brandName: nil, applicationUri: nil, isTailored: false, additionalInformation: nil)
        
    let links = Links(self: "/cds-au/v1/banking/products?page-size=2", first: "/cds-au/v1/banking/products?page-size=2&page=1", next: "/cds-au/v1/banking/products?page-size=2&page=2", last: "/cds-au/v1/banking/products?page-size=2&page=14")
    let meta = Meta(totalRecords: 28, totalPages: 14)
    
    if let path = Bundle(for: type(of: self)).path(forResource: "ProductDetail", ofType: "json") {
      do {
        let jsonStr = try String(contentsOfFile: path)
        if let jsonData = jsonStr.data(using: .utf8) {
          let mockApi = MockApiService()
          mockApi.data = jsonData
          mockApi.response = HTTPURLResponse(url: URL(string: "https://localhost")!, statusCode: 200, httpVersion: nil, headerFields: nil)
          let commbank = Commbank()
          commbank.api = mockApi
          commbank.queue = DispatchQueue.global()
          commbank.fetchProductDetail(productId: "ad22b1f0967349e8a5d586afe7f0d845", completion: { response in
            print("Response: \(response)")
            XCTAssertEqual(product, response.data)
            XCTAssertEqual(links, response.links)
            XCTAssertEqual(meta, response.meta)
          })
        }
      } catch {
        XCTFail()
      }
    }
  }
}
