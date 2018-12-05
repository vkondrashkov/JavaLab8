//
//  DragonHeadsPresenter.swift
//  JavaLab7
//
//  Created by Vladislav Kondrashkov on 11/22/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol DragonHeadsPresenter {
    func viewDidLoad()
    func submitButtonDidPressed()
}

class DragonHeadsPresenterImplementation: DragonHeadsPresenter {
    private weak var view: DragonHeadsView!
    private var model: DragonHeadsModel!
    
    init(view: DragonHeadsView) {
        self.view = view
        self.model = DragonHeadsModelImplementation()
    }
    
    func viewDidLoad() {
        
    }
    
    func submitButtonDidPressed() {
        guard let view = view as? DragonHeadsViewController,
            let ageInput = view.ageField.text,
            let age = Int(ageInput),
            age > 0 else {
                self.view.display(result: "Error!")
                return
        }
        let heads = model.countHeads(age: age)
        view.display(result: "Dragon heads: " + String(heads))
    }
}
