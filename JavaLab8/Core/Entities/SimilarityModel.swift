//
//  SimilarityModel.swift
//  JavaLab8
//
//  Created by Vladislav Kondrashkov on 12/6/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol SimilarityModel {
    func areDigitsSimilar(number: Int) -> Bool
}

class SimilarityModelImplementation: SimilarityModel {
    func areDigitsSimilar(number: Int) -> Bool {
        var currentNumber = number
        var previousNumber = number % 10
        while currentNumber != 0 {
            let digit = currentNumber % 10
            currentNumber /= 10
            if previousNumber != digit {
                return false
            }
            previousNumber = digit
        }
        return true
    }
}
