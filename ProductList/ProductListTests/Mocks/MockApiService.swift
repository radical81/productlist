//
//  MockApiService.swift
//  ProductListTests
//
//  Created by Rex Jason Alobba on 18/3/21.
//

import Foundation
@testable import ProductList

class MockApiService: ApiService {
  
  var data: Data?
  var response: URLResponse?
  var error: Error?
  
  override func fetchData(endpoint: String, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
      completion(data, response, error)
  }
}
