//
//  FibonacciModel.swift
//  JavaLab8
//
//  Created by Vladislav Kondrashkov on 12/6/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol FibonacciModel {
    func fibonacciElements(by index: Int) -> [Int]
}

class FibonacciModelImplementation: FibonacciModel {
    func fibonacciElements(by index: Int) -> [Int] {
        var previousNumber = 0
        var currentNumber = 1
        var fibonacciNumbers: [Int] = []
        for _ in 0..<index {
            fibonacciNumbers.append(currentNumber)
            let buffer = currentNumber
            currentNumber += previousNumber
            previousNumber = buffer
        }
        return fibonacciNumbers
    }
}
