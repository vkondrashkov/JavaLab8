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
    private var model: NumbersSumModel
    
    init(view: NumbersSumView) {
        self.view = view
        self.model = NumbersSumModelImplementation()
    }
    
    func submitButtonDidPressed() {
        guard let view = view as? NumbersSumViewController,
            let numberFieldText = view.numberField.text,
            let number = Int(numberFieldText),
            number > 0 else {
                self.view?.display(error: "Error!")
                return
        }
        let digitsSum = model.calculateDigitsSum(number: number)
        view.display(result: "Result: " + String(digitsSum))
    }
}
