//
//  Scene.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 08/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import Foundation

enum Scene {
    case menu(MenuViewModel)
    case tables(TablesViewModel)
    case map(MapViewModel)
}
