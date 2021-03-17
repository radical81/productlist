//
//  Product.swift
//  ProductList
//
//  Created by Rex Jason Alobba on 17/3/21.
//

import Foundation

struct Product: Codable {
  var productId: String?
  var effectiveFrom: String?
  var effectiveTo: String?
  var lastUpdated: String?
  var productCategory: String?
  var name: String?
  var description: String?
  var brand: String?
  var brandName: String?
  var applicationUri: String?
  var isTailored: Bool?
  var additionalInformation: AdditionalInfo?
}

struct AdditionalInfo: Codable {
    var overviewUri: String?
    var termsUri: String?
    var eligibilityUri: String?
    var feesAndPricingUri: String?
}

struct GetProductsResponse: Codable {
  var data: ProductList?
  var links: Links?
  var meta: Meta?
}

struct ProductList: Codable {
  var products: [Product]?
}
