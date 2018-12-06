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
        let numbersSumTabBarIcon = UIImage(named: "digitsSum")
        let numbersSumTabBarItem = UITabBarItem(title: "Numbers sum", image: numbersSumTabBarIcon, tag: 0)
        numbersSumViewController.tabBarItem = numbersSumTabBarItem

        let similarityViewController = similarityCoordinator.rootViewController
        let similarityTabBarIcon = UIImage(named: "similarity")
        let similarityTabBarItem = UITabBarItem(title: "Similarity", image: similarityTabBarIcon, tag: 1)
        similarityViewController.tabBarItem = similarityTabBarItem
        
        let palindromeViewController = palindromeCoordinator.rootViewController
        let palindromeTabBarIcon = UIImage(named: "palindrome")
        let palindromeTabBarItem = UITabBarItem(title: "Palindrome", image: palindromeTabBarIcon, tag: 2)
        palindromeViewController.tabBarItem = palindromeTabBarItem
        
        let maxDigitViewController = maxDigitCoordinator.rootViewController
        let maxDigitTabBarIcon = UIImage(named: "maxDigit")
        let maxDigitTabBarItem = UITabBarItem(title: "Max digit", image: maxDigitTabBarIcon, tag: 3)
        maxDigitViewController.tabBarItem = maxDigitTabBarItem
        
        let fibonacciViewController = fibonacciCoordinator.rootViewController
        let fibonacciTabBarIcon = UIImage(named: "fibonacci")
        let fibonacciTabBarItem = UITabBarItem(title: "Fibonacci", image: fibonacciTabBarIcon, tag: 4)
        fibonacciViewController.tabBarItem = fibonacciTabBarItem
        
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
