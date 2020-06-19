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

class MenuViewController: UITableViewController {

    @IBOutlet var containerView: UIView!
    
    private let disposeBag = DisposeBag()
    var viewModel: MenuViewModelType!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.delegate = nil
        tableView.dataSource = nil
        bindViewModel()
    }
    
    func bindViewModel() {
        
        bindTable()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        let controller = segue.destination
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
            .map { indexPath in
//                let cell = self.tableView.cellForRow(at: indexPath) as! MenuCell
//                return cell.viewModel as! MenuCellViewModel
                return indexPath
            }
        .subscribe(onNext: { (indexPath) in
            if indexPath.row == 0 {
                self.performSegue(withIdentifier: "tablesView", sender: self)
            } else if indexPath.row == 1 {
                self.performSegue(withIdentifier: "mapView", sender: self)
            }
        })
    
//            .subscribe(viewModel.presentViewAction.inputs)
//            .disposed(by: disposeBag)
    
        let selectedCell = IndexPath(row: 0, section: 0)
        tableView.selectRow(at: selectedCell, animated: false, scrollPosition: .none)
    }
}
