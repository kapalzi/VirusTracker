//
//  MenuCellViewModel.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 08/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import Foundation

enum MenuTitle: String {
    case tables = "Tables"
    case map = "Map"
    case charts = "Charts"
    case faq = "FAQ"
    case news = "News"
    
    func getTitle() -> String {
        return self.rawValue
    }
}

class MenuCellViewModel: MenuCellViewModelType {
    
    var imageName: String
    var title: MenuTitle

    init(withTitle title: MenuTitle, andImageName imageName: String) {
        
        self.title = title
        self.imageName = imageName
    }
}
