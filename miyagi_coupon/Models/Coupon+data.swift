//
//  Coupon.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/07/18.
//

import Foundation
import SwiftUI

//struct Coupon: Decodable, Hashable, Identifiable {
//    var id: Int64
//    var shop: Shop
//    var image: String
//    var name: String
//    var detail: String
//}

extension Coupon: Identifiable{
    static var data: [Coupon] {
        [
            Coupon(id: "1", name: "ステーキ半額クーポン", image:"izakaya", detail: "本店自慢のステーキをランチタイム限定で半額でお召し上がりいただけます"),
            Coupon(id: "2", name: "ステーキ半額クーポン", image:"izakaya", detail: "本店自慢のステーキをランチタイム限定で半額でお召し上がりいただけます")
        ]
    }
}
