//
//  SwiftFuncExtension.swift
//  Tasty
//
//  Created by Vitaliy Kuzmenko on 21/10/14.
//  Copyright (c) 2014 Vitaliy Kuz'menko. All rights reserved.
//

import Foundation
import CoreGraphics

extension CGSize {
    
    func aspectRatioForWidth(newWidth: CGFloat) -> CGSize {
        let newHeight = height * newWidth / width
        return CGSizeMake(ceil(newWidth), ceil(newHeight))
    }
    
    func aspectRatioForHeight(newHeight: CGFloat) -> CGSize {
        let newWidth = width * newHeight / height
        return CGSizeMake(ceil(newWidth), ceil(newHeight))
    }
    
}


func angleFromDegrees(degrees: CGFloat) -> CGFloat {
    return M_PI.f * degrees / 180.0
}

func percentageForValue(value1: CGFloat, ofValue value2: CGFloat) -> CGFloat {
    return (100 * value1) / value2
}

func delay(delay: NSTimeInterval, closure:() -> Void) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}

// MARK: - Threading

// MARK: - Int

extension Int {
    
    var f: CGFloat {
        return CGFloat(self)
    }
    
}

extension Double {
    
    var f: CGFloat {
        return CGFloat(self)
    }
    
}

extension Float {
    
    var f: CGFloat {
        return CGFloat(self)
    }
    
}
