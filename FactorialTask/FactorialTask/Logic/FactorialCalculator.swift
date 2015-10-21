//
//  FactorialCalculator.swift
//  FactorialTask
//
//  Created by MAXIM TSVETKOV on 20.10.15.
//  Copyright © 2015 MAXIM TSVETKOV. All rights reserved.
//

import Foundation

class FactorialCalculator: NSObject, FactorialCalculatorInputInterface {

    internal weak var output: FactorialCalculatorOutputInterface?
    
    // MARK: - FactorialCalculatorInputInterface
    
    func calculateFactorialRecordsWithLimit(limit: NSNumber) {
        
        let calculationLimit = limit.unsignedLongValue
        let calculationStartNumber = 2 as UInt
        let calculationStartResult = 1 as UInt
        
        let priority = DISPATCH_QUEUE_PRIORITY_HIGH
        dispatch_async(dispatch_get_global_queue(priority, 0)) {
            
            if (calculationLimit > 0) {
                self.calculateWithNumber(calculationStartNumber, limit: calculationLimit, result: calculationStartResult)
            }
            
        }
        
    }
    
    // MARK: - Helper
    
    func calculateWithNumber(number: UInt, let limit: UInt, var result: UInt) {
        
        dispatch_sync(dispatch_get_main_queue()) {
            
            let recordString = String(format: "%@ (%@! = %@)", (number - 1) as NSNumber, (number - 1) as NSNumber, result as NSNumber)
            self.output!.onDidCalculateFactorialRecord(recordString)
            
        }
        
        let isMultiplicationOverFlown = isMultiplicationOverFlownUnsignedLongTypeWithMultiplier1(result, multiplier2: number)
        
        if (!isMultiplicationOverFlown) {
            
            result *= number;
            
            let isLimitExceeded = result > limit;
            
            if (!isLimitExceeded) {
                
                calculateWithNumber(number + 1, limit: limit, result: result)

            }
            
        }
        
    }
    
    func isMultiplicationOverFlownUnsignedLongTypeWithMultiplier1(multiplier1: UInt, multiplier2: UInt) -> Bool {
        
        let result = multiplier2 > UInt.max / multiplier1
        
        return result
    }
}