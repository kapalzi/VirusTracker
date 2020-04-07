//
//  Global.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 07/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import Foundation

struct Global: Codable {
    
    let newConfirmed:Int
    let totalConfirmed:Int
    let newDeaths:Int
    let totalDeaths:Int
    let newRecovered:Int
    let totalRecovered:Int
    
    init() {
        newConfirmed = 0
        totalConfirmed = 0
        newDeaths = 0
        totalDeaths = 0
        newRecovered = 0
        totalRecovered = 0
    }
    
    enum CodingKeys: String, CodingKey {
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case newDeaths = "NewDeaths"
        case totalDeaths = "TotalDeaths"
        case newRecovered = "NewRecovered"
        case totalRecovered = "TotalRecovered"
    }
}
