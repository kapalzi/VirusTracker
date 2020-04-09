//
//  MenuCellViewModelType.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 08/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import Foundation

protocol MenuCellViewModelType: class {
    
    var imageName: String { get }
    var title: MenuTitle { get }
}
