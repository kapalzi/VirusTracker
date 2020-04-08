//
//  MenuViewController.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 07/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MenuViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    private let viewModel: MenuViewModelType = MenuViewModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        bindTable()
    }
    
    private func bindTable() {
        
        viewModel.dataSource
            .asDriver()
            .drive(tableView.rx.items) { tableView, row, viewModel in
                let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell
                cell.configureWith(viewModel)
                return cell
            }
            .disposed(by: disposeBag)
    
        let selectedCell = IndexPath(row: 0, section: 0)
        tableView.selectRow(at: selectedCell, animated: false, scrollPosition: .none)
    }
}
