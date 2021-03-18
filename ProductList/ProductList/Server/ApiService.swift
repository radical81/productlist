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
