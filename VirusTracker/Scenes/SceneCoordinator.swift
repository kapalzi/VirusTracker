//
//  SceneCoordinator.swift
//  VirusTracker
//
//  Created by Krzysztof Kapała on 08/04/2020.
//  Copyright © 2020 Krzysztof Kapala. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class SceneCoordinator: SceneCoordinatorType {

    fileprivate var window: UIWindow
    fileprivate var currentViewController: UIViewController
    private let disposeBag = DisposeBag()
    var rightNavigationController: UINavigationController
    var lastContainer: UIViewController? = nil

    required init(window: UIWindow, rightNavigationController: UINavigationController) {
        self.window = window
        self.currentViewController = window.rootViewController!
        self.rightNavigationController = rightNavigationController
    }

    static func actualViewController(for viewController: UIViewController) -> UIViewController {

        if let navigationController = viewController as? UINavigationController {
          return navigationController.viewControllers.first!
        } else {
          return viewController
        }
    }

    @discardableResult
    func transition(to scene: Scene, type: SceneTransitionType) -> Completable {
        
        let subject = PublishSubject<Void>()
        let viewController = scene.viewController()
                
        switch type {
            case .root:
                currentViewController = SceneCoordinator.actualViewController(for: viewController)
                window.rootViewController = viewController
                subject.onCompleted()

            case .push:
                rightNavigationController.rx.delegate
                    .sentMessage(#selector(UINavigationControllerDelegate.navigationController(_:didShow:animated:)))
                    .map { _ in }
                    .bind(to: subject)
                    .disposed(by: disposeBag)
                rightNavigationController.pushViewController(viewController, animated: true)
                currentViewController = SceneCoordinator.actualViewController(for: viewController)

            case .modal:
                currentViewController.present(viewController, animated: true) {
                  subject.onCompleted()
                }
                currentViewController = SceneCoordinator.actualViewController(for: viewController)
        
        
    }
    return subject.asObservable()
        .take(1)
        .ignoreElements()
  }

  @discardableResult
  func pop(animated: Bool) -> Completable {
    let subject = PublishSubject<Void>()
    if let presenter = currentViewController.presentingViewController {
      // dismiss a modal controller
      currentViewController.dismiss(animated: animated) {
        self.currentViewController = SceneCoordinator.actualViewController(for: presenter)
        subject.onCompleted()
      }
    } else if let navigationController = currentViewController.navigationController {
      // navigate up the stack
      // one-off subscription to be notified when pop complete
      _ = navigationController.rx.delegate
        .sentMessage(#selector(UINavigationControllerDelegate.navigationController(_:didShow:animated:)))
        .map { _ in }
        .bind(to: subject)
      guard navigationController.popViewController(animated: animated) != nil else {
        fatalError("can't navigate back from \(currentViewController)")
      }
      currentViewController = SceneCoordinator.actualViewController(for: navigationController.viewControllers.last!)
    } else {
      fatalError("Not a modal, no navigation controller: can't navigate back from \(currentViewController)")
    }
    return subject.asObservable().take(1).ignoreElements()
  }
}
