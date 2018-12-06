//
//  SimilarityPresenter.swift
//  JavaLab8
//
//  Created by Vladislav Kondrashkov on 12/6/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol SimilarityPresenter {
    func submitButtonDidPressed()
}

class SimilarityPresenterImplementation: SimilarityPresenter {
    private weak var view: SimilarityView?
    private var model: SimilarityModel
    
    init(view: SimilarityView) {
        self.view = view
        self.model = SimilarityModelImplementation()
    }
    
    func submitButtonDidPressed() {
        guard let view = view as? SimilarityViewController,
            let numberFieldText = view.numberField.text,
            let number = Int(numberFieldText),
            number > 0 else {
                self.view?.display(error: "Error!")
                return
        }
        let areSimilar = model.areDigitsSimilar(number: number)
        if areSimilar {
            view.display(result: "All digits are similar")
        }
        else {
            view.display(result: "Some digits are different")
        }
    }
}
