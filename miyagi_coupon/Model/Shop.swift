//
//  Shop.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/07/17.
//

import Foundation
import SwiftUI

struct Shop: Decodable, Hashable, Identifiable {
    var id: Int64
    var name: String
    var imageUrl: String
    var distance: Int64
    var values: String
}

extension Shop {
    static var data: [Shop] {
        [
            Shop(id: 1, name: "お肉本舗 本店", imageUrl: "yakiniku", distance: 100, values: "1000-2000"),
            Shop(id: 2, name: "居酒屋", imageUrl: "izakaya", distance: 150, values: "1000-1500"),
            Shop(id: 3, name: "ラーメン", imageUrl: "ramen", distance: 200, values: "750-1000")
        ]
    }
}
