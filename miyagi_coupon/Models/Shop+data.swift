//
//  Shop.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/07/17.
//

import Foundation
import SwiftUI

//struct Shop: Decodable, Hashable, Identifiable {
//    var id = UUID().uuidString
//    var name: String
//    var imageUrl: String
//    var distance: Int64
//    var values: String
//    var latitude: Double
//    var longitude: Double
//}

extension Shop: Identifiable {
    static var data: [Shop] {
        [
            Shop(name: "お肉本舗 本店", image: "yakiniku", latitude: 38.264802, longitude: 140.880050),
            Shop(name: "居酒屋", image: "izakaya", latitude: 38.264802, longitude: 140.871050),
            Shop(name: "ラーメン", image: "ramen", latitude: 38.264802, longitude: 140.867050)
        ]
    }
}
