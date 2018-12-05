//
//  AppCoordinator.swift
//  JavaLab8
//
//  Created by Vladislav Kondrashkov on 11/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

protocol Coordinator {
    var rootViewController: UIViewController { get }
    func start()
}

class AppCoordinator: Coordinator {
    private let window: UIWindow
    
    var rootViewController: UIViewController {
        return window.rootViewController!
    }
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        let tabCoordinator = TabCoordinator(window: window)
        tabCoordinator.start()
    }
}
