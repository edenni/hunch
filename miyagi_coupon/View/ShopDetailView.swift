//
//  ShopDetailView.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/07/17.
//

import SwiftUI

struct ShopDetailView: View {
    let shop: Shop
    let coupons: [Coupon]
    let sw = UIScreen.screenWidth
    
    var body: some View {
        ZStack {
            Color(hex: 0xf3f3f3).edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing:0) {
                    Image(shop.imageUrl)
                        .resizable()
                        .frame(width:sw, height: 0.75*sw)
                    
                    Text(shop.name)
                        .font(Font.custom("Tamil MN Bold", size: 35))
                        .padding(.top, 30)
                    
                    Capsule()
                        .fill(Color(hex: 0xe2e228))
                        .frame(width: 35, height: 4, alignment: .center)
                        .padding(EdgeInsets(top: 1, leading: 0, bottom: 5, trailing: 0))

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
                
                VStack(spacing:0) {
                    HStack {
                        Text("クーポン")
                            .padding(.leading, 0.117*sw)
                            .font(Font.custom("Tamil MN Bold", size: 23))
                        Spacer()
                    }
                    
                    ForEach(coupons) { coupon in
                        CouponView(coupon: coupon)
                            .padding(.bottom, 30)
                    }
                }
                .padding(.top, 23)
                .padding(.bottom, 0)
            }
        }
        .edgesIgnoringSafeArea(.top)
        // TODO: hide navigation bar.
        // Just using Image ?
    }
}

struct ShopDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShopDetailView(shop: Shop.data[0], coupons: Coupon.data)
    }
}
