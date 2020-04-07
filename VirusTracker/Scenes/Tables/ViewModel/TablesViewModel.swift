//
//  TablesViewModel.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 07/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import RxSwift
import RxCocoa

class TablesViewModel: TablesViewModelType {
    
    private let service: NetworkService
    private let dataSubject = BehaviorSubject<Summary>(value: Summary())
    private let disposeBag = DisposeBag()
    
    var totalCellViewModelsDriver: Driver<[TablesCellViewModelType]> {
        return dataSubject.asDriver(onErrorJustReturn: Summary())
            .map {
                $0.countries.sorted {
                    $0.totalConfirmed > $1.totalConfirmed
                }
                .map {
                    TablesCellViewModel(TableEntry(country: $0.country, amount: "\($0.totalConfirmed)"))
                }
            }
    }
    
    var deathsCellViewModelsDriver: Driver<[TablesCellViewModelType]> {
        return dataSubject.asDriver(onErrorJustReturn: Summary())
            .map {
                $0.countries.sorted {
                    $0.totalDeaths > $1.totalDeaths
                }
                .map {
                    TablesCellViewModel(TableEntry(country: $0.country, amount: "\($0.totalDeaths)"))
                }
            }
    }
    var recoveredCellViewModelsDriver: Driver<[TablesCellViewModelType]> {
        return dataSubject.asDriver(onErrorJustReturn: Summary())
            .map {
                $0.countries.sorted {
                    $0.totalRecovered > $1.totalRecovered
                }
                .map {
                    TablesCellViewModel(TableEntry(country: $0.country, amount: "\($0.totalRecovered)"))
                }
            }
    }
    
    var totalHeaderDriver: Driver<String> {
        return dataSubject.asDriver(onErrorJustReturn: Summary())
            .map {
                "\($0.global.totalConfirmed)"
            }
    }
    
    var deathsHeaderDriver: Driver<String> {
        return dataSubject.asDriver(onErrorJustReturn: Summary())
            .map {
                "\($0.global.totalDeaths)"
            }
    }
    
    var recoveredHeaderDriver: Driver<String> {
        return dataSubject.asDriver(onErrorJustReturn: Summary())
            .map {
                "\($0.global.totalRecovered)"
            }
    }
    
    init(_ service: NetworkService) {
        
        self.service = service
        
        downloadData()
    }
    
    func bindToSummary() {
        
        
    }
    
    func downloadData() {
        
        return service
            .load(SingleItemResource<Summary>(action: BasicAction.summary))
            .subscribe(dataSubject)
            .disposed(by: disposeBag)
    }
}
