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
    
    init(view: SimilarityView) {
        self.view = view
    }
    
    func submitButtonDidPressed() {
        // Model request
    }
}
