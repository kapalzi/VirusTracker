//
//  UIView+Extension.swift
//  learnwords
//
//  Created by Krzysztof Kapała on 06/12/2018.
//  Copyright © 2018 kapala. All rights reserved.
//

import UIKit

extension UIView{
    
    func dropShadow() {
        self.backgroundColor = #colorLiteral(red: 0.2247756124, green: 0.2432734072, blue: 0.2733631134, alpha: 1)
        self.layer.cornerRadius = 15
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowOpacity = 0.25
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
}

