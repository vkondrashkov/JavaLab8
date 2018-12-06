//
//  SimilarityCoordinator.swift
//  JavaLab8
//
//  Created by Vladislav Kondrashkov on 12/6/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

class SimilarityCoordinator: Coordinator {
    var rootViewController: UIViewController {
        return navigationController
    }
    
    private var view: SimilarityViewController
    private var navigationController: UINavigationController
    
    init() {
        view = SimilarityViewController()
        let presenter = SimilarityPresenterImplementation(view: view)
        view.presenter = presenter
        
        navigationController = UINavigationController(rootViewController: view)
    }
    
    func start() {
        
    }
}
