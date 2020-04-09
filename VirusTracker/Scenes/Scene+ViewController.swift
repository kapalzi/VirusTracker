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
            
        case .tables(_):
            let vc = storyboard.instantiateViewController(withIdentifier: "TablesViewController") as! TablesViewController
            return vc
            
        case .map(_):
            let vc = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
            return vc
        }
    }
}
