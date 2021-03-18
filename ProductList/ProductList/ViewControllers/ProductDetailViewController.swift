//
//  ProductDetailViewController.swift
//  ProductList
//
//  Created by Rex Jason Alobba on 19/3/21.
//

import UIKit

class ProductDetailViewController: UIViewController {

  @IBOutlet weak var productName: UILabel!
  let commbank = Commbank()
  var productId: String?
  var response: ProductDetailResponse?
  var links: Links?
  var meta: Meta?

  
  override func viewDidLoad() {
      super.viewDidLoad()
      commbank.api = ApiService.shared
    if let id = productId {
      commbank.fetchProductDetail(productId: id, completion: { response in
      self.response = response
      self.links = response.links
      self.meta = response.meta
        print("detail response \(response)")
        self.productName.text = response.data?.name
    })

    }
    
  }

      
        
    


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
