//
//  ApiService.swift
//  ProductList
//
//  Created by Rex Jason Alobba on 17/3/21.
//

import Foundation

class ApiService {
  static let shared = ApiService()
  
  var session: URLSession
  
  init(session: URLSession = URLSession.shared) {
    self.session = session
  }
  
  func fetchData(endpoint: String, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    guard let url = URL(string: endpoint) else { return }
    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("2", forHTTPHeaderField: "x-v")
    request.httpMethod = "GET"
    let task = session.dataTask(with: request) { (data, response, error) in
      completion(data, response, error)      
    }
    task.resume()
  }
}


class DataTaskMock: URLSessionDataTask {
    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
      self.closure = closure
    }

    override func resume() {
      // Don't actually resume any task. Run the closure.
      closure()
    }
}
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
