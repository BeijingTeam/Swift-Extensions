//
//  UITextField+Extension.swift
//  WhatToCook
//
//  Created by Vitaliy Kuzmenko on 12/10/14.
//  Copyright (c) 2014 KuzmenkoFamily. All rights reserved.
//

import UIKit

extension UITextField {
    
    var selectedRange: NSRange {
        let start = selectedTextRange?.start
        let end = selectedTextRange?.end
        let loc = offsetFromPosition(beginningOfDocument, toPosition: start!)
        let len = offsetFromPosition(start!, toPosition: end!)
    
        return NSMakeRange(loc, len)
    }
    
    func textRangeFromRange(range: NSRange) -> UITextRange {
        let start = positionFromPosition(beginningOfDocument, offset: range.location)
        let end = positionFromPosition(beginningOfDocument, offset: range.location + range.length)
        return textRangeFromPosition(start, toPosition: end)
    }
    
    var rangeForFullText: NSRange {
        let loc = 0
        let len = offsetFromPosition(beginningOfDocument, toPosition: endOfDocument)
        return NSMakeRange(loc, len)
    }
    
    var textRangeForFullText: UITextRange {
        return textRangeFromRange(rangeForFullText)
    }
    
}
