//
//  TablesCell.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 07/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import UIKit

class TablesCell: UITableViewCell {

    @IBOutlet var countryLbl: UILabel!
    @IBOutlet var amountLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureWith(_ viewModel: TablesCellViewModelType) {
        
        countryLbl.text = viewModel.country
        amountLbl.text = viewModel.amount
        layoutIfNeeded()
    }

}
