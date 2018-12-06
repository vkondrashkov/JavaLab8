//
//  PalindromeModel.swift
//  JavaLab8
//
//  Created by Vladislav Kondrashkov on 12/6/18.
//  Copyright © 2018 Vladislav Kondrashkov. All rights reserved.
//

import Foundation

protocol PalindromeModel {
    func isPalindrome(number: Int) -> Bool
}

class PalindromeModelImplementation: PalindromeModel {
    func isPalindrome(number: Int) -> Bool {
        let reversedNumber = reverseNumber(number: number)
        return reversedNumber == number
    }
    
    private func reverseNumber(number: Int) -> Int {
        var currentNumber = number
        var reversedNumber = 0
        while currentNumber != 0 {
            let digit = currentNumber % 10
            currentNumber /= 10
            reversedNumber = reversedNumber * 10 + digit
        }
        return reversedNumber
    }
}
