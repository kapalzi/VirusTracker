//
//  SummaryResponse.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 07/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import Foundation

struct Summary: Codable {
    
    let global: Global
    let countries: [Country]
    let date: String
    
    init() {
        
        self.global = Global()
        self.countries = Array<Country>()
        self.date = ""
    }
    
    enum CodingKeys: String, CodingKey {
        case global = "Global"
        case countries = "Countries"
        case date = "Date"
    }
}
