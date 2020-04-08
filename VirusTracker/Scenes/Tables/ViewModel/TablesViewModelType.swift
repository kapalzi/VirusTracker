//
//  TablesViewModelType.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 07/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import RxCocoa

protocol TablesViewModelType: class {
    
    var totalCellViewModelsDriver: Driver<[TablesCellViewModelType]> { get }
    var deathsCellViewModelsDriver: Driver<[TablesCellViewModelType]> { get }
    var recoveredCellViewModelsDriver: Driver<[TablesCellViewModelType]> { get }
    
    var totalHeaderDriver: Driver<String> { get }
    var deathsHeaderDriver: Driver<String> { get }
    var recoveredHeaderDriver: Driver<String> { get }
    

}
