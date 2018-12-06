//
//  MaxDigitModel.swift
//  JavaLab8
//
//  Created by Vladislav Kondrashkov on 12/6/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol MaxDigitModel {
    func findMaxDigit(number: Int) -> Int
}

class MaxDigitModelImplementation: MaxDigitModel {
    func findMaxDigit(number: Int) -> Int {
        var currentNumber = number
        var max = currentNumber % 10
        while currentNumber != 0 {
            let digit = currentNumber % 10
            currentNumber /= 10
            if digit > max {
                max = digit
            }
        }
        return max
    }
}
