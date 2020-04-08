//
//  SceneTransitionType.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 08/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import Foundation

enum SceneTransitionType {
  // you can extend this to add animated transition types,
  // interactive transitions and even child view controllers!
    
  case root       // make view controller the root view controller
  case push       // push view controller to navigation stack
  case modal      // present view controller modally
}
