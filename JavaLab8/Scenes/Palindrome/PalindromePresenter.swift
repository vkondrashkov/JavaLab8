//
//  PalindromePresenter.swift
//  JavaLab8
//
//  Created by Vladislav Kondrashkov on 12/6/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol PalindromePresenter {
    func submitButtonDidPressed()
}

class PalindromePresenterImplementation: PalindromePresenter {
    private weak var view: PalindromeView?
    
    init(view: PalindromeView) {
        self.view = view
    }
    
    func submitButtonDidPressed() {
        // Model request
    }
}
