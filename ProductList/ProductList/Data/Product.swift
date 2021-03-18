//
//  Product.swift
//  ProductList
//
//  Created by Rex Jason Alobba on 17/3/21.
//

import Foundation

struct Product: Codable, Equatable {
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
  static func == (lhs: Product, rhs: Product) -> Bool {
    return lhs.productId == rhs.productId &&
      lhs.effectiveFrom == rhs.effectiveFrom &&
      lhs.effectiveTo == rhs.effectiveTo &&
      lhs.lastUpdated == rhs.lastUpdated &&
      lhs.productCategory == rhs.productCategory &&
      lhs.name == rhs.name &&
      lhs.description == rhs.description &&
      lhs.brand == rhs.brand &&
      lhs.brandName == rhs.brandName &&
      lhs.applicationUri == rhs.applicationUri &&
      lhs.isTailored == rhs.isTailored &&
      lhs.additionalInformation == rhs.additionalInformation
  }
}

struct AdditionalInfo: Codable, Equatable {
    var overviewUri: String?
    var termsUri: String?
    var eligibilityUri: String?
    var feesAndPricingUri: String?
    static func == (lhs: AdditionalInfo, rhs: AdditionalInfo) -> Bool {
      return lhs.overviewUri == rhs.overviewUri &&
        lhs.termsUri == rhs.termsUri &&
        lhs.eligibilityUri == rhs.eligibilityUri &&
        lhs.feesAndPricingUri == rhs.feesAndPricingUri
    }
}

struct ProductResponse: Codable {
  var data: ProductList?
  var links: Links?
  var meta: Meta?
}

struct ProductList: Codable {
  var products: [Product]?
}
