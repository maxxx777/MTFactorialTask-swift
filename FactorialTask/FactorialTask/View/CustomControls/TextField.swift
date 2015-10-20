//
//  TextField.swift
//  FactorialTask
//
//  Created by MAXIM TSVETKOV on 20.10.15.
//  Copyright © 2015 MAXIM TSVETKOV. All rights reserved.
//

import UIKit

class TextField: UITextField {

    override func canPerformAction(action: Selector, withSender sender: AnyObject?) -> Bool {
        return false;
    }
    
}