//
//  NumbersSumCoordinator.swift
//  JavaLab8
//
//  Created by Vladislav Kondrashkov on 12/5/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class NumbersSumCoordinator: Coordinator {
    var rootViewController: UIViewController {
        return view
    }
    
    private var view: NumbersSumViewController
    
    init() {
        view = NumbersSumViewController()
        let presenter = NumbersSumPresenterImplementation(view: view)
        view.presenter = presenter
    }
    
    func start() {
        
    }
}
