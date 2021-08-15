//
//  CancellableSet.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/08/15.
//

import Foundation
import Combine

class CancellableSet {
    static var shared = CancellableSet()
    
    var set = Set<AnyCancellable>()
}
