//
//  Links.swift
//  ProductList
//
//  Created by Rex Jason Alobba on 17/3/21.
//

import Foundation

struct Links: Codable, Equatable {
  var `self`: String?
  var first: String?
  var next: String?
  var last: String?
  
  static func == (lhs: Links, rhs: Links) -> Bool {
    return lhs.`self` == rhs.`self` &&
      lhs.first == rhs.first &&
      lhs.next == rhs.next &&
      lhs.last == rhs.last
  }
}
