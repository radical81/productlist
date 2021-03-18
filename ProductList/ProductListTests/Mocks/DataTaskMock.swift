//
//  DataTaskMock.swift
//  ProductListTests
//
//  Created by Rex Jason Alobba on 18/3/21.
//

import Foundation

class DataTaskMock: URLSessionDataTask {
    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
      self.closure = closure
    }

    override func resume() {
      // Don't actually resume any task. Run the closure.
      closure()
    }
}
