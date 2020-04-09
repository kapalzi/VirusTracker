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

class MenuViewController: UIViewController, BindableType {

    @IBOutlet var tableView: UITableView!
    @IBOutlet var containerView: UIView!
    
    private let disposeBag = DisposeBag()
    var viewModel: MenuViewModelType!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    func bindViewModel() {
        
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
        
        tableView.rx.itemSelected
            .map { [unowned self] indexPath in
                let cell = self.tableView.cellForRow(at: indexPath) as! MenuCell
                return cell.viewModel as! MenuCellViewModel
            }
        .subscribe(viewModel.presentViewAction.inputs)
        .disposed(by: disposeBag)
    
        let selectedCell = IndexPath(row: 0, section: 0)
        tableView.selectRow(at: selectedCell, animated: false, scrollPosition: .none)
    }
}
