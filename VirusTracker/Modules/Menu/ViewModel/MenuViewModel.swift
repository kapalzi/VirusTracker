//
//  MenuViewModel.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 07/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import RxSwift
import RxCocoa
import Action

class MenuViewModel: MenuViewModelType {
    
    let sceneCoordinator: SceneCoordinatorType
    private let disposeBag = DisposeBag()
    
    var dataSource: BehaviorRelay<[MenuCellViewModelType]>
    
    init(coordinator: SceneCoordinatorType) {
        
        let cellModels = [MenuCellViewModel(withTitle: .tables, andImageName: "icons8-table-50"),
                          MenuCellViewModel(withTitle: .map, andImageName: "icons8-world-map-50"),
                          MenuCellViewModel(withTitle: .charts, andImageName: "icons8-combo-chart-50"),
                          MenuCellViewModel(withTitle: .faq, andImageName: "icons8-faq-50"),
                          MenuCellViewModel(withTitle: .news, andImageName: "icons8-news-50")]
        self.dataSource = BehaviorRelay<[MenuCellViewModelType]>(value: cellModels)
        self.sceneCoordinator = coordinator
        presentTables()
    }
    
    func presentTables() {
        
        let tablesViewModel = TablesViewModel(BasicNetworkService())
        sceneCoordinator.transition(to: .tables(tablesViewModel), type: .container)
    }
    
    lazy var presentViewAction: Action<MenuCellViewModel, Never> = { this in
        return Action<MenuCellViewModel, Never> { cellViewModel in
            let mapViewModel = MapViewModel()
            print("AAAAAAAAAAA")
            return this.sceneCoordinator.transition(to: .map(mapViewModel), type: .container).asObservable()
        }
    }(self)
    
    func presentMap() {
        
        
    }
    
}
