//
//  ProductListCollectionViewController.swift
//  ProductList
//
//  Created by Rex Jason Alobba on 20/3/21.
//

import UIKit

private let reuseIdentifier = "ProductCell"

class ProductListCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
  
  //Data vars
  var response: ProductResponse?
  var links: Links?
  var meta: Meta?
  
  //API handler
  let commbank = Commbank()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.clearsSelectionOnViewWillAppear = false

    self.navigationItem.title = "Commbank Products"
    
    // Register cell classes
    let nib = UINib(nibName: "ProductListCollectionViewCell",bundle: nil)
    self.collectionView!.register(nib, forCellWithReuseIdentifier: reuseIdentifier)    
    
    commbank.api = ApiService.shared
    commbank.fetchProducts { response in
      self.response = response
      self.links = response.links
      self.meta = response.meta
      self.collectionView.reloadData()
    }
  }

  // MARK: UICollectionViewDataSource

  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }

  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return response?.data?.products?.count ?? 0
  }

  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProductListCollectionViewCell
    cell.product = response?.data?.products?[indexPath.row]
    return cell
  }

  // MARK: UICollectionViewDelegate
    
  override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
    return true
  }
    
  override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
    return true
  }
    
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let productDetail = ProductDetailViewController()
    productDetail.productId = response?.data?.products?[indexPath.row].productId
    self.navigationController?.pushViewController(productDetail, animated: true)
  }
  
  // MARK: UICollectionViewDelegateFlowLayout
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    //Cell sizes
    let width = (view.frame.width - 50)/3
    return CGSize(width: width, height: width)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
  }
  
  // MARK: Accessibility Font Sizing
  override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
    self.collectionView.reloadData()
  }
}
