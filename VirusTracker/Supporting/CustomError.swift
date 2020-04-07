//
//  CustomError.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 07/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import Foundation

struct CustomError: LocalizedError {
  let value: String
  var localizedDescription: String {
    return value
  }
}
