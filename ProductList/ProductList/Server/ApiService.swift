//
//  ApiService.swift
//  ProductList
//
//  Created by Rex Jason Alobba on 17/3/21.
//

import Foundation

class ApiService {
  static let shared = ApiService(endpoint: Endpoints.products.rawValue)
  
  let endpoint: String
  
  private init(endpoint: String) {
    self.endpoint = endpoint
  }
  
  func fetchData(completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
    guard let url = URL(string: self.endpoint) else { return }
    var request = URLRequest(url: url)
    request.setValue("application/json", forHTTPHeaderField: "Accept")
    request.setValue("2", forHTTPHeaderField: "x-v")
    request.httpMethod = "GET"
    let session = URLSession.shared
    let task = session.dataTask(with: request) { (data, response, error) in
      completion(data, response, error)      
    }
    task.resume()
  }
}
