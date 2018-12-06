//
//  PalindromeCoordinator.swift
//  JavaLab8
//
//  Created by Vladislav Kondrashkov on 12/6/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class PalindromeCoordinator: Coordinator {
    var rootViewController: UIViewController {
        return navigationController
    }
    
    private var view: PalindromeViewController
    private var navigationController: UINavigationController
    
    init() {
        view = PalindromeViewController()
        let presenter = PalindromePresenterImplementation(view: view)
        view.presenter = presenter
        
        navigationController = UINavigationController(rootViewController: view)
    }
    
    func start() {
        
    }
}
