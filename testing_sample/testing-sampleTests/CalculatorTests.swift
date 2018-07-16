//
//  CalculatorTests.swift
//  testing-sampleTests
//
//  Created by 原隆幸 on 2018/07/14.
//  Copyright © 2018年 takayuki.hara. All rights reserved.
//

import XCTest
import Nimble
@testable import testing_sample

class CalculatorTests: XCTestCase {

    var calculator: Calculator!

    override func setUp() {
        super.setUp()
        calculator = Calculator()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testCalculator_addition() {
        // Arrange:

        // Act:
        let result = calculator.addition(a: 1, b: 1)

        // Assert: use XCTest
        XCTAssertTrue(result == 2)
    }

    func testCalculator_subtraction() {
        // Arrange:

        // Act:
        let result = calculator.subtraction(a: 1, b: 1)

        // Assert: use Nimble
        expect(result).to(equal(0))
    }

    func testCalculator_operators() {
        // Arrange:

        // Act:
        let result = Calculator.operators

        // Assert: use Nimble
        expect(result).to(contain(["addition"]))
    }

    func test_nimble() {
        expect(1 + 1).to(equal(2))
        expect(1.2).to(beCloseTo(1.1, within: 0.1))
        expect(3) > 2
        expect("seahorse").to(contain("sea"))
        expect(["Atlantic", "Pacific"]).toNot(contain("Mississippi"))
    }
}
