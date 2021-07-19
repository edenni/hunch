//
//  ShopListView.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/07/17.
//

import SwiftUI
import UIKit


struct ShopListView: View {
//    @ObservedObject var viewModel: ShopListViewModel
    let shops: [Shop]
    let screenWidth = UIScreen.screenWidth
    
    var body: some View {
        NavigationView{
            ZStack{
                Color(hex: 0xf3f3f3).edgesIgnoringSafeArea(.all)
                VStack(spacing:0) {
                    ScrollView(.vertical, showsIndicators: false) {
                        Text("今日なに食べる？")
                            .padding(EdgeInsets(top: 21, leading: 0.08*screenWidth, bottom: 0, trailing: 0))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .font(Font.custom("Tamil MN Bold", size: 35))
                            .foregroundColor(Color(hex: 0x4a4a4a))
                        
                        ForEach(shops) { shop in
                            NavigationLink(destination: ShopDetailView(shop: shop, coupons: Coupon.data)) {
                                ShopListItem(shop: shop)
                                    .padding(10)
                            }
                            .buttonStyle(FlatLinkStyle())
                        }
                    }
                }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct FlatLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct ShopListView_Previews: PreviewProvider {
    static var previews: some View {
        ShopListView(shops: Shop.data)
    }
}
