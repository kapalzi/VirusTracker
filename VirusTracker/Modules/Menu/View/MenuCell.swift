//
//  MenuCell.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 08/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import UIKit

class MenuCell: UITableViewCell {
    
    @IBOutlet var iconImageView: UIImageView!
    @IBOutlet var titleLbl: UILabel!
    
    var viewModel: MenuCellViewModelType!
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            iconImageView.tintColor = #colorLiteral(red: 0.8394343853, green: 0.3521963358, blue: 0.191323638, alpha: 1)
            titleLbl.textColor = #colorLiteral(red: 0.8394343853, green: 0.3521963358, blue: 0.191323638, alpha: 1)
            backgroundColor = #colorLiteral(red: 0.2247756124, green: 0.2432734072, blue: 0.2733631134, alpha: 1)
        } else {
            iconImageView.tintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            titleLbl.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            backgroundColor = #colorLiteral(red: 0.2247756124, green: 0.2432734072, blue: 0.2733631134, alpha: 1)
        }
    }
    
    func configureWith(_ model: MenuCellViewModelType) {
        
        viewModel = model
        iconImageView.image = UIImage(named: viewModel.imageName)?.withRenderingMode(.alwaysTemplate)
        titleLbl.text = viewModel.title.getTitle()
        selectionStyle = .none
        
        layoutIfNeeded()
    }
}
