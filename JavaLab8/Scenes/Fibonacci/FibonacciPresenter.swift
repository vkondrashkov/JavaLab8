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
    private var model: FibonacciModel
    
    init(view: FibonacciView) {
        self.view = view
        self.model = FibonacciModelImplementation()
    }
    
    func submitButtonDidPressed() {
        guard let view = view as? FibonacciViewController,
            let numberFieldText = view.numberField.text,
            let number = Int(numberFieldText),
            number > 0 else {
                self.view?.display(error: "Error!")
                return
        }
        let fibonacciNumbers = model.fibonacciElements(by: number)
        view.display(error: " ")
        view.display(result: fibonacciNumbers)
    }
}
