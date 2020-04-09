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
    
//    init(coordinator: SceneCoordinatorType)
    init() {
        
        let cellModels = [MenuCellViewModel(withTitle: .tables),
                          MenuCellViewModel(withTitle: .map),
                          MenuCellViewModel(withTitle: .charts),
                          MenuCellViewModel(withTitle: .faq),
                          MenuCellViewModel(withTitle: .news)]
        self.dataSource = BehaviorRelay<[MenuCellViewModelType]>(value: cellModels)
        self.sceneCoordinator = SceneCoordinator()
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
