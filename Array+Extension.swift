//
//  Array+Utilites.swift
//  WhatToCook
//
//  Created by Виталий Кузьменко on 17/08/14.
//  Copyright (c) 2014 KuzmenkoFamily. All rights reserved.
//

import Foundation

extension Array {
    func indexOfObject<T: Equatable>(array: Array<T>, object: T) -> Int? {
      var i: Int
     
      for i = 0; i < array.count; ++i {
        if (array[i] == object) {
          return i
        }
      }
     
      return nil
    }
}