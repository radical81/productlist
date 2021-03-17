//
//  Commbank.swift
//  ProductList
//
//  Created by Rex Jason Alobba on 17/3/21.
//

import Foundation

class Commbank {

  var delegate: ProductDataDelegate?
  
  var products: [Product]? {
    didSet {
      if let value = products {
        delegate?.updateProductList(productList: value)
      }
    }
  }
  
  var links: Links? {
    didSet {
      
    }
  }
  
  var meta: Meta? {
    didSet {
      
    }
  }
  
  func getProducts() {
    ApiService.shared.fetchData(completion: { data, response, error in
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
      DispatchQueue.main.sync {
        do {
          let productsResponse = try JSONDecoder().decode(GetProductsResponse.self, from: jsonData)
          print("Response data:\n \(productsResponse)")
          self.products = productsResponse.data?.products
        } catch let jsonErr {
          print(jsonErr)
        }
      }
    })
  }
  
  func handleClientError(_: Error) {
    
  }
  
  func handleServerError(_: URLResponse?) {
    
  }
}
