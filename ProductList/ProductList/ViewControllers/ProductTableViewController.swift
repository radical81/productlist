//
//  ProductTableViewController.swift
//  ProductList
//
//  Created by Rex Jason Alobba on 17/3/21.
//

import Foundation
import UIKit

class ProductTableViewController: UITableViewController {
  var productList: [Product]?
  let commbank = Commbank()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ProductCell")
    commbank.delegate = self
    commbank.api = ApiService.shared
    commbank.getProducts { response in
      self.productList = response.data?.products
      self.tableView.reloadData()
    }
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.productList?.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
    cell.textLabel?.text = productList?[indexPath.row].name
    return cell
  }

  
}

extension ProductTableViewController: ProductDataDelegate {
    
  // ProductDataDelegate
  func updateProductList(productList: [Product]) {
    self.productList = productList
    
  }
}

