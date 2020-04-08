//
//  MenuCellViewModel.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 08/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import Foundation

class MenuCellViewModel: MenuCellViewModelType {
    
    var imageName: String
    var title: String
    
    init(withTitle title: String, andImageName imageName: String) {
        
        self.title = title
        self.imageName = imageName
    }
}
