//
//  ViewController.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 07/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TablesViewController: UIViewController {

    @IBOutlet var menuTableView: UITableView!
    @IBOutlet var totalTableView: UITableView!
    @IBOutlet var deathsTableView: UITableView!
    @IBOutlet var recoveredTableView: UITableView!
    
    private let disposeBag = DisposeBag()
    private let viewModel: TablesViewModelType = TablesViewModel(BasicNetworkService())
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        bindTotalTableView()
        bindDeathsTableView()
        bindRecoveredTableView()
    }

    private func bindTotalTableView() {
        
        viewModel.totalCellViewModelsDriver
            .drive(totalTableView.rx.items) { tableView, row, viewModel in
                let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! TablesCell
                cell.configureWith(viewModel)
                return cell
            }
            .disposed(by: disposeBag)
        
        totalTableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
    
    private func bindDeathsTableView() {
        
        viewModel.deathsCellViewModelsDriver
            .drive(deathsTableView.rx.items) { tableView, row, viewModel in
                let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! TablesCell
                cell.configureWith(viewModel)
                return cell
            }
            .disposed(by: disposeBag)
        
        deathsTableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
    
        private func bindRecoveredTableView() {
            
            viewModel.recoveredCellViewModelsDriver
                .drive(recoveredTableView.rx.items) { tableView, row, viewModel in
                    let cell = tableView.dequeueReusableCell(withIdentifier: "TableCell") as! TablesCell
                    cell.configureWith(viewModel)
                    return cell
                }
                .disposed(by: disposeBag)
            
            recoveredTableView.rx.setDelegate(self)
                .disposed(by: disposeBag)
        }

}

extension TablesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let frame = CGRect(x: 0, y: 0, width: tableView.frame.width, height: 180)
        let view = HeaderView(frame: frame)
        
        if tableView === self.totalTableView {
            view.titleLbl.text = "Total Confirmed"
            viewModel.totalHeaderDriver
                .drive(view.amountLbl.rx.text)
                .disposed(by: disposeBag)
        } else if tableView == self.deathsTableView {
            view.titleLbl.text = "Total Deaths"
            viewModel.deathsHeaderDriver
                .drive(view.amountLbl.rx.text)
                .disposed(by: disposeBag)
        } else if tableView == self.recoveredTableView {
            view.titleLbl.text = "Total Recovered"
            viewModel.recoveredHeaderDriver
                .drive(view.amountLbl.rx.text)
                .disposed(by: disposeBag)
        }
        view.dropShadow()
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 180
    }
    
    func bindHeaderView(_ view: HeaderView) {
        

    }
}
