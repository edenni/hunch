//
//  ContentView.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/07/17.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ShopListView(shops: Shop.data)
                .tabItem {
                    Image(systemName: "house")
                    Text("ホーム")
                }
            ShopMapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("マップ")
                }
            SettingView()
                .tabItem {
                    Image(systemName: "gearshape")
                    Text("設定")
                }
        }
        .background(Color(hex: 0xf9f9f9))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
