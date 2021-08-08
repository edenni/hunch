//
//  ShopMapView.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/07/18.
//

import SwiftUI
import MapKit

struct IdentifiablePlace: Identifiable {
    let id: UUID
    let location: CLLocationCoordinate2D
    init(id: UUID = UUID(), lat: Double, long: Double) {
        self.id = id
        self.location = CLLocationCoordinate2D(
            latitude: lat,
            longitude: long)
    }
}

struct ShopMapView: View {
    @ObservedObject private var locationManager: LocationManager
    @ObservedObject private var shopViewModel: ShopViewModel
    @State private var showDetail: Bool
    @State var places: [IdentifiablePlace]
    
    init(shopViewModel: ShopViewModel) {
        self.showDetail = false
        self.locationManager = LocationManager.shared
        self.shopViewModel = shopViewModel
        self.places = shopViewModel.nearByShops.map { shop in
            IdentifiablePlace(lat: shop.latitude!, long: shop.longitude!)
        }
        
        NotificationManager.shared.requestAuthorization { granted in
          if granted {
             print("auth granted")
          }
        }
    }
    
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
                    annotationItems: places) {
                    place in
                        MapAnnotation(coordinate: place.location) {
                            Button(action: {
                                showDetail.toggle()
                            }) {
                                Image(systemName: "mappin")
                                    .resizable()
                            }
                            .frame(width: 10, height: 30)
                        }
                }
                
                if showDetail {
                    ZStack {
                        
                        NavigationLink(destination: ShopDetailView(shop: Shop.data[0], coupons: Coupon.data)) {
                            ShopListItem(shop: Shop.data[0])
                        }
                        
                    }
                    .padding(.bottom, 120)
                }
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ShopMapView_Previews: PreviewProvider {
    static var previews: some View {
        ShopMapView(shopViewModel: ShopViewModel())
    }
}
