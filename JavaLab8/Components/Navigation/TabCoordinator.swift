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
    
    
    // let coordinator: Coordinator

    var coordinators: [Coordinator] {
        return [] // Coordinators
    }
    
    init(window: UIWindow) {
        self.window = window
        tabController = TabViewController()
        // Init coordinators
    }
    
    func start() {
        var controllers: [UIViewController] = []
        /*
        let vowelConsonantViewController = vowelConsonantCoordinator.rootViewController
        let vowelInactiveTabBarImage = UIImage(named: "vowels-inactive")
        let vowelActiveTabBarImage = UIImage(named: "vowels")
        let vowelConsonantTabBarItem = UITabBarItem(title: "Vowels", image: vowelInactiveTabBarImage, selectedImage: vowelActiveTabBarImage)
        vowelConsonantViewController.tabBarItem = vowelConsonantTabBarItem
        */
        
        // controllers.append(vowelConsonantViewController)
        
        tabController.viewControllers = controllers
        tabController.tabBar.isTranslucent = false
        window.rootViewController = tabController
        window.makeKeyAndVisible()
    }
}
