//
//  TabCoordinator.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit
import SwipeableTabBarController

final class TabCoordinator: Coordinator {
    let window: UIWindow
    let tabController: SwipeableTabBarController
    
    var rootViewController: UIViewController {
        return tabController
    }
    
    let numbersSumCoordinator: NumbersSumCoordinator
    let similarityCoordinator: SimilarityCoordinator
    let palindromeCoordinator: PalindromeCoordinator
    let maxDigitCoordinator: MaxDigitCoordinator
    let fibonacciCoordinator: FibonacciCoordinator
    
    var coordinators: [Coordinator] {
        return [numbersSumCoordinator, similarityCoordinator, palindromeCoordinator, maxDigitCoordinator, fibonacciCoordinator]
    }
    
    init(window: UIWindow) {
        self.window = window
        tabController = SwipeableTabBarController()
        tabController.setSwipeAnimation(type: SwipeAnimationType.sideBySide)

        numbersSumCoordinator = NumbersSumCoordinator()
        similarityCoordinator = SimilarityCoordinator()
        palindromeCoordinator = PalindromeCoordinator()
        maxDigitCoordinator = MaxDigitCoordinator()
        fibonacciCoordinator = FibonacciCoordinator()
    }
    
    func start() {
        var controllers: [UIViewController] = []

        let numbersSumViewController = numbersSumCoordinator.rootViewController
        numbersSumViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0) // Temporary

        let similarityViewController = similarityCoordinator.rootViewController
        similarityViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 1) // Temporary
        
        let palindromeViewController = palindromeCoordinator.rootViewController
        palindromeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2) // Temporary
        
        let maxDigitViewController = maxDigitCoordinator.rootViewController
        maxDigitViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 3) // Temporary
        
        let fibonacciViewController = fibonacciCoordinator.rootViewController
        fibonacciViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .history, tag: 4) // Temporary
        
        controllers.append(numbersSumViewController)
        controllers.append(similarityViewController)
        controllers.append(palindromeViewController)
        controllers.append(maxDigitViewController)
        controllers.append(fibonacciViewController)
        
        tabController.viewControllers = controllers
        tabController.tabBar.isTranslucent = false
        window.rootViewController = tabController
        window.makeKeyAndVisible()
    }
}
