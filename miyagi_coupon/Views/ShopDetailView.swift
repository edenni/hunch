//
//  ShopDetailView.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/07/17.
//

import SwiftUI
import Kingfisher

struct ShopDetailView: View {
    @EnvironmentObject var store: Store
    var currentUser: User? { store.appState.settings.loginUser
    }
    let shop: Shop
    let coupons: [Coupon]
    let sw = UIScreen.screenWidth
    
    var body: some View {
        ZStack {
            Color(hex: 0xf3f3f3).edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing:0) {
                    KFImage(URL(string: shop.image!))
                        .resizable()
                        .frame(width:sw, height: 0.75*sw)
                    
                    if (currentUser != nil) && shop.shopmasterID == currentUser?.sub {
                        HStack {
                            Spacer()
                            Image(systemName: "square.and.pencil")
                            Image(systemName: "lock")
                        }
                    }
                    
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
                        Text("\(shop.min_budget ?? 0) - \(shop.max_budget ?? 0)")
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
                    .padding(.bottom, 10)
                    
                    ForEach(coupons) { coupon in
                        CouponView(coupon: coupon)
                            .padding(.bottom, 30)
                    }
                    
                    Button("仮通知機能") {
                        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                            if success {
                                print("All set!")
                            } else if let error = error {
                                print(error.localizedDescription)
                            }
                        }
                        
                        let content = UNMutableNotificationContent()
                        content.title = "店舗みっけ"
                        content.subtitle = "お肉本店"
                        content.sound = UNNotificationSound.default

                        // show this notification five seconds from now
                        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

                        // choose a random identifier
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

                        // add our notification request
                        UNUserNotificationCenter.current().add(request)
                    }
//                    .hidden()
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
