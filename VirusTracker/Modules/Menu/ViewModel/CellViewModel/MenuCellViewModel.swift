//
//  MenuCellViewModel.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 08/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import UIKit

enum MenuTitle: String {
    case tables = "Tables"
    case map = "Map"
    case charts = "Charts"
    case faq = "FAQ"
    case news = "News"

    var title: String {
        return self.rawValue
    }
    
    var image: UIImage {
        
        switch self {
        case .tables:
            return UIImage(named: "icons8-table-50")!
        case .map:
            return UIImage(named: "icons8-world-map-50")!
        case .charts:
            return UIImage(named: "icons8-combo-chart-50")!
        case .faq:
            return UIImage(named: "icons8-faq-50")!
        case .news:
            return UIImage(named: "icons8-news-50")!
        }
    }
}

class MenuCellViewModel: MenuCellViewModelType {
    
    var title: MenuTitle

    init(withTitle title: MenuTitle) {
        
        self.title = title
    }
}
