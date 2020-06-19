//
//  SceneDelegate.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 07/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard
            let splitViewController = window?.rootViewController as? UISplitViewController,
            let leftNavController = splitViewController.viewControllers.first as? UINavigationController,
            let menuViewController = leftNavController.viewControllers.first as? MenuViewController,
            let rightNavController = splitViewController.viewControllers.last as? UINavigationController
            else { fatalError() }
            
        let sceneCoordinator = SceneCoordinator(window: window!, rightNavigationController: rightNavController)
        let tablesViewModel = TablesViewModel(BasicNetworkService())
        let menuViewModel = MenuViewModel(coordinator: sceneCoordinator)
        menuViewController.viewModel = menuViewModel
        
        let rightScene = Scene.tables(tablesViewModel)
        sceneCoordinator.transition(to: rightScene, type: .push)
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }


}

