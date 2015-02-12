//
//  NSURL+Extension.swift
//  Tasty
//
//  Created by Vitaliy Kuzmenko on 09/01/15.
//  Copyright (c) 2015 Vitaliy Kuz'menko. All rights reserved.
//

import UIKit

extension NSURL {
    
    var URLWithScaleFactor: NSURL {
        let urlString = absoluteString!
        var ext = urlString.pathExtension
        if ext.isEmpty {
            ext = "jpg"
        }
        let scale = UIScreen.mainScreen().scale
        let scaleFactor = String(format: "#screen@%dx.%@", Int(scale), ext)
        
        if urlString.contains(scaleFactor) {
            return self
        } else {
            let urlStringWithScaleFactor = urlString.stringByAppendingString(scaleFactor)
            return NSURL(string: urlStringWithScaleFactor)!
        }
    }
    
    var youTubeVideoIdentifier: String? {
        if let string = absoluteString {
            var error: NSError?
            let regEx = NSRegularExpression(pattern: "v=([^&]+)", options: .CaseInsensitive, error: &error)
            let match = regEx?.firstMatchInString(string, options: nil, range: NSMakeRange(0, count(string)))
            if match != nil {
                let range = match!.rangeAtIndex(1)
                let identifier = (string as NSString).substringWithRange(range)
                return identifier
            }
        }
        return nil
    }
    
}

