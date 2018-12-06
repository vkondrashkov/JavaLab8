//
//  FibonacciPresenter.swift
//  JavaLab8
//
//  Created by Vladislav Kondrashkov on 12/6/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol FibonacciPresenter {
    func submitButtonDidPressed()
}

class FibonacciPresenterImplementation: FibonacciPresenter {
    private weak var view: FibonacciView?
    
    init(view: FibonacciView) {
        self.view = view
    }
    
    func submitButtonDidPressed() {
        // Model request
    }
}
