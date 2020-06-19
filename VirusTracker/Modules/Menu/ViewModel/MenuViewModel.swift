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
        
        let cellModels = [MenuCellViewModel(withTitle: .tables),
                          MenuCellViewModel(withTitle: .map),
                          MenuCellViewModel(withTitle: .charts),
                          MenuCellViewModel(withTitle: .faq),
                          MenuCellViewModel(withTitle: .news)]
        self.dataSource = BehaviorRelay<[MenuCellViewModelType]>(value: cellModels)
        self.sceneCoordinator = coordinator
    }
    
    lazy var presentViewAction: Action<MenuCellViewModel, Never> = { this in
        return Action<MenuCellViewModel, Never> { cellViewModel in
                    
            switch cellViewModel.title {
            case .tables:
                let tablesViewModel = TablesViewModel(BasicNetworkService())
                return this.sceneCoordinator.transition(to: .tables(tablesViewModel), type: .push).asObservable()
            case .map:
                let mapViewModel = MapViewModel()
                return this.sceneCoordinator.transition(to: .map(mapViewModel), type: .push).asObservable()
            case .charts:
                let tablesViewModel = TablesViewModel(BasicNetworkService())
                return this.sceneCoordinator.transition(to: .tables(tablesViewModel), type: .push).asObservable()
            case .faq:
                let tablesViewModel = TablesViewModel(BasicNetworkService())
                return this.sceneCoordinator.transition(to: .tables(tablesViewModel), type: .push).asObservable()
            case .news:
                let tablesViewModel = TablesViewModel(BasicNetworkService())
                return this.sceneCoordinator.transition(to: .tables(tablesViewModel), type: .push).asObservable()
            }
        }
    }(self)
    
    func presentMap() {
        
        
    }
    
}
