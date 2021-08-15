//
//  Shop.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/07/17.
//

import Foundation
import SwiftUI
import MapKit
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
    public var distance: Double {
        get {
            100.0
        }
    }
    
    public var coordinate: CLLocationCoordinate2D {
        get {
            .init(latitude:self.latitude!, longitude:self.longitude!)
        }
    }
    
    static var data: [Shop] {
        [
            Shop(name: "お肉本舗 本店", image: "https://www.ozmall.co.jp/Content/upload/images/daff2724080e4b4bb3bb459a2f11827d.jpg", latitude: 38.264802, longitude: 140.880050),
            Shop(name: "居酒屋", image: "izakaya", latitude: 38.264802, longitude: 140.871050),
            Shop(name: "ラーメン", image: "ramen", latitude: 38.264802, longitude: 140.867050)
        ]
    }
}
