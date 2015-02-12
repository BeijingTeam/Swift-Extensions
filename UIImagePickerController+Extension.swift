//
//  UIImagePickerController+Extension.swift
//  Tasty
//
//  Created by Vitaliy Kuzmenko on 21/10/14.
//  Copyright (c) 2014 Vitaliy Kuz'menko. All rights reserved.
//

import UIKit
import AssetsLibrary

extension UIImagePickerController {
    
    class func getLastPhotoWithCompletion(completion: (UIImage?) -> Void) {
        
        let assetsLibrary = ALAssetsLibrary()
        assetsLibrary.enumerateGroupsWithTypes(ALAssetsGroupSavedPhotos, usingBlock: { (group, stop) -> Void in
            
            if group != nil {
                group.setAssetsFilter(ALAssetsFilter.allPhotos())
                if group.numberOfAssets() > 0 {
                    group.enumerateAssetsAtIndexes(NSIndexSet(index: group.numberOfAssets() - 1), options: nil, usingBlock: { (result, index, stop) -> Void in
                        if result != nil {
                            let representation = result.defaultRepresentation()
                            let cgImage = representation.fullResolutionImage().takeUnretainedValue()
                            
                            let image = UIImage(CGImage: cgImage)
                            completion(image)
                        }
                    })
                } else {
                    completion(nil)
                }
            }
            
        }, { (flag) -> Void in
            completion(nil)
        })
        
    }
    
}

