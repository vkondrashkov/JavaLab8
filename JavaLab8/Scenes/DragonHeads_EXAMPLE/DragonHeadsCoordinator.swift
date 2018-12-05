//
//  DragonHeadsCoordinator.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import UIKit

final class DragonHeadsCoordinator: Coordinator {
    var rootViewController: UIViewController {
        return view
    }
    
    private var view: DragonHeadsViewController
    
    init() {
        view = DragonHeadsViewController()
        let presenter = DragonHeadsPresenterImplementation(view: view)
        view.presenter = presenter
    }
    
    func start() {
        
    }
}
