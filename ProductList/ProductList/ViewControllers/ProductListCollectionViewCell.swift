//
//  ProductListCollectionViewCell.swift
//  ProductList
//
//  Created by Rex Jason Alobba on 20/3/21.
//

import UIKit

class ProductListCollectionViewCell: UICollectionViewCell {

  @IBOutlet weak var name: UILabel?
  
  var product: Product? {
    didSet {
      self.name?.text = product?.name      
    }
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()   
  }
}
