//
//  MaxDigitCoordinator.swift
//  JavaLab8
//
//  Created by Vladislav Kondrashkov on 12/6/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class MaxDigitCoordinator: Coordinator {
    var rootViewController: UIViewController {
        return navigationController
    }
    
    private var view: MaxDigitViewController
    private var navigationController: UINavigationController
    
    init() {
        view = MaxDigitViewController()
        let presenter = MaxDigitPresenterImplementation(view: view)
        view.presenter = presenter
        
        navigationController = UINavigationController(rootViewController: view)
    }
    
    func start() {
        
    }
}
