//
//  NumbersSumPresenter.swift
//  JavaLab8
//
//  Created by Vladislav Kondrashkov on 12/5/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol NumbersSumPresenter {
    func submitButtonDidPressed()
}

class NumbersSumPresenterImplementation: NumbersSumPresenter {
    private weak var view: NumbersSumView?
    
    init(view: NumbersSumView) {
        self.view = view
    }
    
    func submitButtonDidPressed() {
        // Model requests
    }
}
