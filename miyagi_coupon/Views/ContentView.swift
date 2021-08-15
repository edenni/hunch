//
//  ContentView.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/07/17.
//

import SwiftUI
import Amplify

struct ContentView: View {
//    var shopViewModel: ShopViewModel
//    var signInViewModel: SignInViewModel
//    @EnvironmentObject var userSession: UserSession
    
    init() {
        NotificationManager.shared.requestAuthorization { granted in
          if granted {
             print("auth granted")
          }
        }
        
//        shopViewModel = ShopViewModel()
//        signInViewModel = SignInViewModel(userSession: UserSession())
    }
    
    var body: some View {
        TabView {
            ShopListView()
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

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
