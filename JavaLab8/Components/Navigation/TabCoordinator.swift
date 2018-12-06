//
//  TabCoordinator.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

final class TabCoordinator: Coordinator {
    let window: UIWindow
    let tabController: UITabBarController
    
    var rootViewController: UIViewController {
        return tabController
    }
    
    let numbersSumCoordinator: NumbersSumCoordinator

    var coordinators: [Coordinator] {
        return [numbersSumCoordinator]
    }
    
    init(window: UIWindow) {
        self.window = window
        tabController = TabViewController()

        numbersSumCoordinator = NumbersSumCoordinator()
    }
    
    func start() {
        var controllers: [UIViewController] = []

        let numbersSumViewController = numbersSumCoordinator.rootViewController
        numbersSumViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0) // Temporary

        controllers.append(numbersSumViewController)
        
        tabController.viewControllers = controllers
        tabController.tabBar.isTranslucent = false
        window.rootViewController = tabController
        window.makeKeyAndVisible()
    }
}
