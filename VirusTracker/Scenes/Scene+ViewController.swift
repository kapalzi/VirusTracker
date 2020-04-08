//
//  Scene+ViewController.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 08/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import UIKit

extension Scene {
    
    func viewController() -> UIViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        switch self {
        case .menu(let viewModel):
            var vc = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
            vc.bindViewModel(to: viewModel)
            return vc
            
        case .tables(let viewModel):
            var vc = storyboard.instantiateViewController(withIdentifier: "TablesViewController") as! TablesViewController
            vc.bindViewModel(to: viewModel)
            return vc
            
        case .map(let viewModel):
            let nc = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! UINavigationController
            var vc = nc.viewControllers.first as! MapViewController
            vc.bindViewModel(to: viewModel)
            return nc
        }
    }
}
