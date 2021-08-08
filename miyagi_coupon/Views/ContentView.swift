//
//  ContentView.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/07/17.
//

import SwiftUI

struct ContentView: View {
    var shopViewModel = ShopViewModel()
    
    var body: some View {
        TabView {
            ShopListView(shopViewModel: shopViewModel)
                .tabItem {
                    Image(systemName: "house")
                    Text("ホーム")
                }
            ShopMapView(shopViewModel: shopViewModel)
                .tabItem {
                    Image(systemName: "map")
                    Text("マップ")
                }
            SettingView(signinmodel: SignInViewModel(userSession: UserSession()))
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
