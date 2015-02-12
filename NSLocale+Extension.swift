//
//  NSLocale+Utilites.swift
//  WhatToCook
//
//  Created by Vitaliy Kuzmenko on 04/10/14.
//  Copyright (c) 2014 KuzmenkoFamily. All rights reserved.
//

import UIKit

extension NSLocale {
    
    class func languageAvailable() -> Array<String> {
        var array = Array<String>()
        let appleLanguages = NSUserDefaults.standardUserDefaults().objectForKey("AppleLanguages") as Array<String>
        
        for language in appleLanguages {
            let path = NSBundle.mainBundle().pathForResource(language, ofType: "lproj")

            if path != nil {
                array.append(language)
            }
        }
        
        return array
    }
    
    class func languageCode() -> String {
        var languageAvailable = self.languageAvailable()
        
        let preferredLanguages = NSLocale.preferredLanguages() as Array<String>
        var currentLanguage = preferredLanguages.first
        
        if !contains(languageAvailable, currentLanguage!) {
            currentLanguage = "en"
        }
        
        return currentLanguage!
    }
    
}

extension NSLocale {
    var decimalSeparator: String {
        return objectForKey(NSLocaleDecimalSeparator) as String
    }
}

