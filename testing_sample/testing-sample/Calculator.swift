//
//  Calculator.swift
//  testing-sample
//
//  Created by 原隆幸 on 2018/07/14.
//  Copyright © 2018年 takayuki.hara. All rights reserved.
//

import Foundation

class Calculator {

    static let operators = ["addition", "subtraction", "multiplication", "division"]

    func addition(a: Int, b: Int) -> Int {
        return a + b
    }

    func subtraction(a: Int, b: Int) -> Int {
        return a - b
    }

    func multiplication(a: Int, b: Int) -> Int {
        return a * b
    }

    func division(a: Int, b: Int) -> Int {
        return a / b
    }

}
