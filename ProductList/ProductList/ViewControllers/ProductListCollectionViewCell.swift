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
    let preferredSize = UIApplication.shared.preferredContentSizeCategory
    switch preferredSize {
      case .accessibilityLarge:
        name?.font = UIFont.systemFont(ofSize: 20)
      break
      case .accessibilityExtraLarge:
        name?.font = UIFont.systemFont(ofSize: 22)
      break
      case .accessibilityExtraExtraLarge:
        name?.font = UIFont.systemFont(ofSize: 25)
      break
      case .accessibilityExtraExtraExtraLarge:
        name?.font = UIFont.systemFont(ofSize: 30)
      break
      default:
        name?.font = UIFont.systemFont(ofSize: 17)
    }
  }
}
