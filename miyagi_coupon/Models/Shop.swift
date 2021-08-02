//
//  Shop.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/07/17.
//

import Foundation
import SwiftUI

struct Shop: Decodable, Hashable, Identifiable {
    var id = UUID().uuidString
    var name: String
    var imageUrl: String
    var distance: Int64
    var values: String
    var latitude: Double
    var longitude: Double
}

extension Shop {
    static var data: [Shop] {
        [
            Shop(name: "お肉本舗 本店", imageUrl: "yakiniku", distance: 100, values: "1000-2000", latitude: 38.264802, longitude: 140.880050),
            Shop(name: "居酒屋", imageUrl: "izakaya", distance: 150, values: "1000-1500", latitude: 38.264802, longitude: 140.871050),
            Shop(name: "ラーメン", imageUrl: "ramen", distance: 200, values: "750-1000", latitude: 38.264802, longitude: 140.867050)
        ]
    }
}
