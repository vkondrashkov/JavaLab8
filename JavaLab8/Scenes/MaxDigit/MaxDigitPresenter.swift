//
//  MaxDigitPresenter.swift
//  JavaLab8
//
//  Created by Vladislav Kondrashkov on 12/6/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol MaxDigitPresenter {
    func submitButtonDidPressed()
}

class MaxDigitPresenterImplementation: MaxDigitPresenter {
    private weak var view: MaxDigitView?
    
    init(view: MaxDigitView) {
        self.view = view
    }
    
    func submitButtonDidPressed() {
        // Model request
    }
}
