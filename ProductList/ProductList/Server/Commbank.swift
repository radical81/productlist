//
//  Commbank.swift
//  ProductList
//
//  Created by Rex Jason Alobba on 17/3/21.
//

import Foundation

class Commbank {
  
  var api: ApiService?
  var queue: DispatchQueue? = .main
    
  func fetchProducts(completion: @escaping(ProductResponse) -> Void) {
    api?.fetchData(endpoint: Endpoints.products.rawValue,  completion: { data, response, error in
      if let error = error {
          self.handleClientError(error)
          return
      }
      guard let httpResponse = response as? HTTPURLResponse,
          (200...299).contains(httpResponse.statusCode) else {
          self.handleServerError(response)
          return
      }
            
      guard let jsonData = data else {return}
      
      do {
        let productResponse = try JSONDecoder().decode(ProductResponse.self, from: jsonData)
        print("Response data:\n \(productResponse)")
        self.queue?.sync {
          completion(productResponse)
        }
      } catch let jsonErr {
        print(jsonErr)
      }
      
    })
  }
  
  func handleClientError(_: Error) {
    
  }
  
  func handleServerError(_: URLResponse?) {
    
  }
}
