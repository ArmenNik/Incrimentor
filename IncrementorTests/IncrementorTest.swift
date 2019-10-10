//
//  IncrementorTest.swift
//  IncrementorTests
//
//  Created by Armen Nikoghosyan on 10/10/19.
//  Copyright © 2019 Armen Nikoghosyan. All rights reserved.
//


import XCTest
@testable import Incrementor

class IncrementorTest: XCTestCase {
    
   /*
    * test metod testGetCurrentNumber
    * current number can`t be negative
    */
    func testGetCurrentNumber()
    {
        let currentNumber = Incrementor.shared.getNumber()
        XCTAssert(currentNumber >= 0, "current number can`t be negative")
    }
    
    /*
     * test metod testIncrementCurrentNumber
     * current number should be increased by 1
     */
    func testIncrementCurrentNumber()
    {
        let currentNumber = Incrementor.shared.getNumber()
        Incrementor.shared.incrementNumber()
        let incrementedCurrentNumber = Incrementor.shared.getNumber()
        XCTAssert(currentNumber + 1 == incrementedCurrentNumber)
    }
    
    /*
     * test metod testUnacceptableIncrementCurrentNumber
     * current number cant be greater than maximum allowed value
     */
    func testUnacceptableIncrementCurrentNumber()
    {
        Incrementor.shared.setMaximumValue(maximumValue: 2)
        for _ in 0..<3 {
          Incrementor.shared.incrementNumber()
        }
        XCTAssert(Incrementor.shared.getNumber() == 0)
    }
    
    /*
     * test metod testUnacceptableMaximumValue
     * if current number greater than maximum value, current number should become 0
     */
    func testUnacceptableCurrentValue()
    {
        Incrementor.shared.setMaximumValue(maximumValue: 500000000000000000)
        XCTAssert(Incrementor.shared.getNumber() == 0)
    }
    
    func testAcceptableMaximumValue()
    {
        Incrementor.shared.setMaximumValue(maximumValue: Int.max)
        XCTAssert(Incrementor.shared.getMaximumAllowedValue() == Int.max)
    }
    
    func testNegativeMaximumValue()
    {
        Incrementor.shared.setMaximumValue(maximumValue: -5)
        XCTAssert(Incrementor.shared.getMaximumAllowedValue() >= 0)
    }
}
