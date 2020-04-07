//
//  TotalHeaderView.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 07/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import UIKit

class HeaderView: UIView {
    
    lazy var titleLbl: UILabel = {
        
        let titleLbl = UILabel(frame: CGRect(x: 0, y: 30, width: frame.width, height: 60))
        titleLbl.textAlignment = .center
        titleLbl.font = UIFont(name: "Avenir Heavy", size: 30)
        titleLbl.textColor = #colorLiteral(red: 0.9332545996, green: 0.9333854914, blue: 0.9332133532, alpha: 1)
        
        return titleLbl
    }()
    
    lazy var amountLbl: UILabel = {
        
        let amountLbl = UILabel(frame: CGRect(x: 0, y: 70, width: frame.width, height: 120))
        amountLbl.textAlignment = .center
        amountLbl.font = UIFont(name: "Avenir Heavy", size: 70)
        amountLbl.textColor = #colorLiteral(red: 0.8394343853, green: 0.3521963358, blue: 0.191323638, alpha: 1)
        
        return amountLbl
    }()

    override init(frame: CGRect) {
        
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {

        backgroundColor = #colorLiteral(red: 0.2247756124, green: 0.2432734072, blue: 0.2733631134, alpha: 1)
        addSubview(titleLbl)
        addSubview(amountLbl)
    }

}
