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
    private var model: PalindromeModel
    
    init(view: PalindromeView) {
        self.view = view
        self.model = PalindromeModelImplementation()
    }
    
    func submitButtonDidPressed() {
        guard let view = view as? PalindromeViewController,
            let numberFieldText = view.numberField.text,
            let number = Int(numberFieldText),
            number > 0 else {
                self.view?.display(error: "Error!")
                return
        }
        let isPalindrome = model.isPalindrome(number: number)
        if isPalindrome {
            view.display(result: "Current number is palindrome")
        }
        else {
            view.display(result: "Current number can't be palindrome")
        }
    }
}
