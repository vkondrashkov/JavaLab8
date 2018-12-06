//
//  NumbersSumModel.swift
//  JavaLab8
//
//  Created by Vladislav Kondrashkov on 12/6/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol NumbersSumModel {
    func calculateDigitsSum(number: Int) -> Int
}

class NumbersSumModelImplementation: NumbersSumModel {
    func calculateDigitsSum(number: Int) -> Int {
        var currentNumber = number
        var sum = 0
        while currentNumber != 0 {
            let digit = currentNumber % 10
            currentNumber /= 10
            sum += digit
        }
        return sum
    }
}
