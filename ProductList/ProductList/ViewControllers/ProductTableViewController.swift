//
//  ProductTableViewController.swift
//  ProductList
//
//  Created by Rex Jason Alobba on 17/3/21.
//

import Foundation
import UIKit

class ProductTableViewController: UITableViewController {
  var response: ProductResponse?
  var links: Links?
  var meta: Meta?
  
  let commbank = Commbank()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ProductCell")    
    commbank.api = ApiService.shared
    commbank.fetchProducts { response in
      self.response = response
      self.links = response.links
      self.meta = response.meta
      self.tableView.reloadData()
    }
  }

  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return response?.data?.products?.count ?? 0
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
    cell.textLabel?.text = response?.data?.products?[indexPath.row].name
    return cell
  }
}

