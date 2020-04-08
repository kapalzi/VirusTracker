//
//  TablesCellViewModel.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 07/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import Foundation

struct TablesCellViewModel: TablesCellViewModelType {
    
    var country: String
    var amount: String
    
    init(withCountry country: String, andAmount amount: String) {
        
        self.country = country
        self.amount = amount
    }
}
