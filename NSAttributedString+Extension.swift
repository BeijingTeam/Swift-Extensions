//
//  NSAttributedString+Extension.swift
//  Tasty
//
//  Created by Vitaliy Kuzmenko on 28/10/14.
//  Copyright (c) 2014 Vitaliy Kuz'menko. All rights reserved.
//

import Foundation

extension NSAttributedString {
    
    convenience init?(HTMLString: String) {
        let data = HTMLString.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
        let opt = [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType]
        self.init(data: data!, options: opt, documentAttributes: nil, error: nil)
    }
    
}


