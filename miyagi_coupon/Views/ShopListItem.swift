//
//  CardView.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/07/04.
//

import Foundation
import SwiftUI
import UIKit
import Kingfisher

struct ShopListItem: View {
    let shop: Shop
    let cardwidth = UIScreen.screenWidth*0.872
    
    var body: some View {
        VStack(spacing: 0) {
            KFImage(URL(string: shop.image!))
                .resizable()
                .frame(width: cardwidth, height: cardwidth*0.75, alignment: .center)
            HStack {
                VStack(spacing:0) {
                    Text(shop.name)
                        .font(Font.custom("Tamil MN Bold", size: 23))
                        .foregroundColor(Color(hex: 0x4a4a4a))
                        .padding(EdgeInsets(top: 10, leading: 0, bottom: 3, trailing: 0))
                        .lineLimit(1)
                    
                    Rectangle()
                        .frame(width: 40, height: 3, alignment: .center)
                        .foregroundColor(Color(hex: 0xe2e228))
                        .padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))

                    HStack(spacing:0) {
                        Image(systemName: "mappin.and.ellipse")
                        Text(String(shop.distance)+"m")
                        Spacer().frame(width:20)
                        Image(systemName: "yensign.circle")
                        Text(shop.values)
                    }
                    .font(Font.custom("Tamil MN Bold", size: 19))
                    .foregroundColor(Color(hex: 0x7b7b7b))
                    .lineLimit(1)
                }
                .frame(width: cardwidth, height: cardwidth*0.25, alignment: .center)
                .layoutPriority(100)
            }
        }
        .background(Color(hex: 0xffffff))
        .cornerRadius(23)
        .frame(width: cardwidth, height: cardwidth, alignment: .center)
    }
}

//struct ShopListItem_Previews: PreviewProvider {
//    static var previews: some View {
//        ShopListItem(shop: Shop(
//            name: "お肉本舗",
//            imageUrl: "megumin",
//            distance: 300,
//            values: "1000 - 2000"
//        ))
//        .previewDevice("iPhone 12 Pro")
//    }
//}
