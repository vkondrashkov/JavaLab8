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
        return view
    }
    
    private var view: SimilarityViewController
    
    init() {
        view = SimilarityViewController()
        let presenter = SimilarityPresenterImplementation(view: view)
        view.presenter = presenter
    }
    
    func start() {
        
    }
}
