//
//  MenuViewModelType.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 07/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import RxCocoa

protocol MenuViewModelType: class {
    
    var dataSource: BehaviorRelay<[MenuCellViewModelType]> { get }
//    Immutable property requirement must be declared as 'var' with a '{ get }' specifier
}
