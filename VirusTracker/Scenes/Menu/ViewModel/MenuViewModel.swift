//
//  MenuViewModel.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 07/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import RxSwift
import RxCocoa

class MenuViewModel: MenuViewModelType {
    
    private let disposeBag = DisposeBag()
    
    var dataSource: BehaviorRelay<[MenuCellViewModelType]>
    
    init() {
        let cellModels = [MenuCellViewModel(withTitle: "Tables", andImageName: "icons8-table-50"),
                          MenuCellViewModel(withTitle: "Map", andImageName: "icons8-world-map-50"),
                          MenuCellViewModel(withTitle: "Charts", andImageName: "icons8-combo-chart-50"),
                          MenuCellViewModel(withTitle: "FAQ", andImageName: "icons8-faq-50"),
                          MenuCellViewModel(withTitle: "News", andImageName: "icons8-news-50")]
        self.dataSource = BehaviorRelay<[MenuCellViewModelType]>(value: cellModels)
    }
    
}
