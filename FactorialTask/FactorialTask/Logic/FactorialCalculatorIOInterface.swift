//
//  FactorialCalculatorIOInterface.swift
//  FactorialTask
//
//  Created by MAXIM TSVETKOV on 20.10.15.
//  Copyright © 2015 MAXIM TSVETKOV. All rights reserved.
//

import Foundation

public protocol FactorialCalculatorInputInterface : NSObjectProtocol {
    
    func calculateFactorialRecordsWithLimit(limit: NSNumber)
    
}

public protocol FactorialCalculatorOutputInterface : NSObjectProtocol {
    
    func onDidCalculateFactorialRecord(record: String)
    
}
