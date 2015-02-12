//
//  NSNumber+Utilites.swift
//  WhatToCook
//
//  Created by Vitaliy Kuzmenko on 08/10/14.
//  Copyright (c) 2014 KuzmenkoFamily. All rights reserved.
//

import UIKit

extension NSNumber {
    
    convenience init(string value: String) {
        var formatter = NSNumberFormatter()
        formatter.numberStyle = .DecimalStyle
        
        let number = formatter.numberFromString(value)
        let double = number?.doubleValue
        
        self.init(double: double!)
    }
    
    
    func wordFormat(titles: [String]) -> String {
        let cases = [2, 0, 1, 1, 1, 2];
        
        let x = integerValue % 100
        if x > 4 && x < 20 {
            return titles[2]
        } else {
            let y = integerValue % 10
            let minimum = min(y, 5)
            let c = cases[minimum]
            return titles[c]
        }
    }
    
    func stringWithWordFormats(formats: [String], format: String) -> String {
        let string = wordFormat(formats)
        return String(format: format, integerValue, string)
    }
}
