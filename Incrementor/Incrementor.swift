//
//  Incrementor.swift
//  Incrementor
//
//  Created by Armen Nikoghosyan on 10/10/19.
//  Copyright © 2019 Armen Nikoghosyan. All rights reserved.
//

import Foundation

class Incrementor {
   
  /*!
   * struct CurrentNumber
   */
   private struct CurrentNumber { 
        var currentValue: UInt
        var maxValue: Int
    }
    
   /*!
    +shared returns a global instance of Incrementor
   */
   static let shared = Incrementor.init()
   
   /*!
    * returns a  instance of CurrentNumber
    * defoult value of current number is 0 and maximum allowed value is maximum value of Int type
    */
   private lazy var currentNumber: CurrentNumber = CurrentNumber.init(currentValue: 0, maxValue: Int.max)

    
    /*!
     * @method -getNumber
     * this method return value for current number
     */
    func getNumber()-> UInt
    {
        return self.currentNumber.currentValue
    }
    
    /*!
     * @method -incrementNumber
     * this method incriment value for current number by 1
     * current number can`t be greater than the maximum allowed value
     */
    func incrementNumber()
    {
        self.currentNumber.currentValue =  self.currentNumber.currentValue.advanced(by: 1) > self.currentNumber.maxValue ? 0 : self.currentNumber.currentValue.advanced(by: 1)
    }
    
    /*!
     * @method -setMaximumValue(maximumValue: UInt)
     * this method setting maximum allowed value for current number
     * maximum allowed value can`t be negative
     * current number can`t be greater than the maximum allowed value
     */
    func setMaximumValue(maximumValue: Int)
    {
        self.currentNumber.maxValue = maximumValue >= 0 ? maximumValue : self.currentNumber.maxValue
        if(self.currentNumber.currentValue > maximumValue) {
           self.currentNumber.currentValue = 0
        }
    }
    
    /*!
     * @method -getMaximumAllowedValue
     * this method return maximum allowed value for current number
     */
    func getMaximumAllowedValue()-> Int
    {
        return self.currentNumber.maxValue
    }
}
