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
    private var model: MaxDigitModel
    
    init(view: MaxDigitView) {
        self.view = view
        self.model = MaxDigitModelImplementation()
    }
    
    func submitButtonDidPressed() {
        guard let view = view as? MaxDigitViewController,
            let numberFieldText = view.numberField.text,
            let number = Int(numberFieldText),
            number > 0 else {
                self.view?.display(error: "Error!")
                return
        }
        let maxNumber = model.findMaxDigit(number: number)
        view.display(result: "Max number is " + String(maxNumber))
    }
}
