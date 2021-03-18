//
//  MockSession.swift
//  ProductListTests
//
//  Created by Rex Jason Alobba on 18/3/21.
//

import Foundation

class MockSession: URLSession {
  // We can inject our own data and error for testing purposes.
  var data: Data?
  var error: Error?

  override func dataTask(with request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
      let data = self.data
      let error = self.error

      return DataTaskMock {
          completionHandler(data, nil, error)
      }
  }
}
