//
//  FibonacciCoordinator.swift
//  JavaLab8
//
//  Created by Vladislav Kondrashkov on 12/6/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class FibonacciCoordinator: Coordinator {
    var rootViewController: UIViewController {
        return navigationController
    }
    
    private var view: FibonacciViewController
    private var navigationController: UINavigationController
    
    init() {
        view = FibonacciViewController()
        let presenter = FibonacciPresenterImplementation(view: view)
        view.presenter = presenter
        
        navigationController = UINavigationController(rootViewController: view)
    }
    
    func start() {
        
    }
}
