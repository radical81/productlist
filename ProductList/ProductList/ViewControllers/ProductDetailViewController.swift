//
//  ProductDetailViewController.swift
//  ProductList
//
//  Created by Rex Jason Alobba on 19/3/21.
//

import UIKit

class ProductDetailViewController: UIViewController {

  //UI Elements
  
  @IBOutlet weak var spinner: UIActivityIndicatorView!
  @IBOutlet weak var productName: UILabel!
  @IBOutlet weak var productDesc: UILabel!
  @IBOutlet weak var moreInfo: UIButton!  

  //Data
  
  let commbank = Commbank()
  var productId: String? {
    didSet {
      if let value = productId {
        self.populateData(id: value)
      }
    }
  }
  var response: ProductDetailResponse? {
    didSet {
      if let value = response {
        self.product = value.data
      }
    }
  }
  var links: Links?
  var meta: Meta?
  var product: Product? {
    didSet {
      if let value = product {
        self.populateDetails(product: value)
      }
    }
  }

  //Life cycle methods
  
  override func viewDidLoad() {
    super.viewDidLoad()
    wait()
  }
  
  //Private methods
  
  private func populateData(id : String) {
    commbank.api = ApiService.shared
    commbank.fetchProductDetail(productId: id, completion: { response in
      self.response = response
      self.links = response.links
      self.meta = response.meta
    })
  }
  private func populateDetails(product: Product) {
    self.productName.text = product.name
    self.productDesc.text = product.description    
    self.showDetails()
  }
  
  private func wait() {
    spinner.isHidden = false
    productName.isHidden = true
    productDesc.isHidden = true
    moreInfo.isHidden = true
  }
  
  private func showDetails() {
    spinner.isHidden = true
    productName.isHidden = false
    productDesc.isHidden = false
    moreInfo.isHidden = (product?.applicationUri == nil)
  }
  
  //IB Actions
  
  @IBAction func didTapMoreInfo(_ sender: Any) {
    if let moreInfoUrl = product?.applicationUri {
      let web = WebViewController()
      web.target = URL(string: moreInfoUrl)
      self.navigationController?.pushViewController(web, animated: true)
    }
  }
}
