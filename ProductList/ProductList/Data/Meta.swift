//
//  Meta.swift
//  ProductList
//
//  Created by Rex Jason Alobba on 17/3/21.
//

import Foundation

struct Meta: Codable, Equatable {
  var totalRecords: Int?
  var totalPages: Int?
  
  static func == (lhs: Meta, rhs: Meta) -> Bool {
    return lhs.totalRecords == rhs.totalRecords &&
      lhs.totalPages == rhs.totalPages
  }
}
