//
//  String+Utilites.swift
//  WhatToCook
//
//  Created by Виталий Кузьменко on 27/08/14.
//  Copyright (c) 2014 KuzmenkoFamily. All rights reserved.
//

import Foundation

extension String {

    var trim: String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    func contains(string: String) -> Bool {
        let innerLowercase = string.lowercaseString
        let selfLowercase = self.lowercaseString
        
        if (selfLowercase.rangeOfString(innerLowercase) != nil) {
            return true
        } else {
            return false
        }
    }
    
    var stringByStrippingHTML: String {
        var string = self
        let charactersToReplace = ["<br>", "<br />", "<br/>", "</p>"]
        
        for charater in charactersToReplace {
            string = string.stringByReplacingOccurrencesOfString(charater, withString: "\n", options: nil, range: nil)
        }
        
        while let range = string.rangeOfString("<[^>]+>", options: .RegularExpressionSearch, range: nil, locale: nil) {
            string = string.stringByReplacingCharactersInRange(range, withString: "")
        }
        
        string = string.stringByReplacingOccurrencesOfString("\n\n", withString: "\n", options: nil, range: nil).trim
        
        return string
    }
    
    var URLEncode: String {
        var originalString = self
        var escapedString = originalString.stringByAddingPercentEncodingWithAllowedCharacters(.URLHostAllowedCharacterSet())
        return escapedString!
    }
    
    var localizeDecimalSeparator: String {
        let nf = NSNumberFormatter()
        let separator = nf.decimalSeparator
        var safeValue = self
        
        if separator? == "," {
            safeValue = self.stringByReplacingOccurrencesOfString(".", withString: ",", options: nil, range: nil)
        } else {
            safeValue = self.stringByReplacingOccurrencesOfString(",", withString: ".", options: nil, range: nil)
        }
        
        return safeValue
    }
}

/**
*  Calculating String Size
*/
extension String {
    
    func sizeWithFont(font: AnyObject) -> CGSize {
        let originalString = self as NSString
        return originalString.sizeWithAttributes([NSFontAttributeName: font])
    }
    
    func widthWithFont(font: AnyObject) -> CGFloat {
        return sizeWithFont(font).width
    }
    
    func heightForWidth(width: CGFloat, withFont font: AnyObject) -> CGFloat {
        
        let attributes = [NSFontAttributeName: font]
        let textStorage = NSTextStorage(string: self, attributes: attributes)
        let textContainer = NSTextContainer(size: CGSizeMake(width, CGFloat.max))
        let layoutManager = NSLayoutManager()
        
        layoutManager.addTextContainer(textContainer)
        textStorage.addLayoutManager(layoutManager)
        layoutManager.glyphRangeForTextContainer(textContainer)
        let height = layoutManager.usedRectForTextContainer(textContainer).height
        return ceil(height) + 1
    }
}

// MARK: - Detector

extension String {
    
    func detectLogins() -> [NSRange] {
        return detectRangeByPattern("\\@\\S+")
    }
    
    func detectHashTags() -> [NSRange] {
        return detectRangeByPattern("\\#\\S+")
    }
    
    func detectRangeByPattern(pattern: String) -> [NSRange] {
        var resultRange = [NSRange]()
        var error: NSError?
        let reg = NSRegularExpression(pattern: pattern, options: NSRegularExpressionOptions.CaseInsensitive, error: &error)
        let range = NSMakeRange(0, countElements(self))
        
        reg?.enumerateMatchesInString(self, options: nil, range: range) { (match: NSTextCheckingResult!, flags: NSMatchingFlags, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
            resultRange.append(match.range)
        }
        
        return resultRange
    }
    
    func detectURL() -> [NSRange] {
        var resultRange = [NSRange]()
        var error: NSError?
        let range = NSMakeRange(0, countElements(self))
        let detector = NSDataDetector(types: NSTextCheckingType.Link.rawValue, error: &error)
        
        detector?.enumerateMatchesInString(self, options: nil, range: range, usingBlock: { (match: NSTextCheckingResult!, flag: NSMatchingFlags, stop: UnsafeMutablePointer<ObjCBool>) -> Void in
            resultRange.append(match.range)
        })
        return resultRange
    }
    
}
