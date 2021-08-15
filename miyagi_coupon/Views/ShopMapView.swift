//
//  ShopMapView.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/07/18.
//

import SwiftUI
import MapKit

struct ShopMapView: View {
    @ObservedObject private var locationManager: LocationManager = LocationManager.shared
    @ObservedObject private var shopViewModel: ShopViewModel = ShopViewModel.shared
    @State private var showDetail: Bool = false
    @State private var userTrackingMode: MapUserTrackingMode = .follow
    @State private var currentShop: Shop?
    
    
    var body: some View {
        NavigationView {
            ZStack(alignment:.bottom) {
//                Button(action: {
//                    showDetail = false
//                    print("clicked")
//                }) {
//                    Spacer()
//                }
//                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .center)
                
                Map(coordinateRegion: $locationManager.region,
                    showsUserLocation: true,
                    userTrackingMode: $userTrackingMode,
                    annotationItems: shopViewModel.nearByShops) {
                    shop in
                        MapAnnotation(coordinate: shop.coordinate) {
                            Button(action: {
                                showDetail.toggle()
                                if showDetail {
                                    currentShop = shop
                                } else {
                                    currentShop = nil
                                }
                            }) {
                                Image(systemName: "mappin")
                                    .resizable()
                            }
                            .frame(width: 10, height: 30)
                        }
                }
                .onTapGesture {
                    self.showDetail = false
                }
                
                if showDetail {
                    ZStack {
                        NavigationLink(destination: ShopDetailView(shop: currentShop!, coupons: currentShop!.Coupons!.elements)) {
                            ShopListItem(shop: currentShop!)
                        }
                        
                    }
                    .padding(.bottom, 120)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

//struct ShopMapView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShopMapView(shopViewModel: ShopViewModel())
//    }
//}
