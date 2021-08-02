//
//  ShopMapView.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/07/18.
//

import SwiftUI
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var region = MKCoordinateRegion()
    private let manager = CLLocationManager()
    
    override init() {
        super.init()
        manager.requestAlwaysAuthorization()
//        manager.requestWhenInUseAuthorization()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            let center = CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude)
//            print($0.coordinate.latitude, $0.coordinate.longitude)
            
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            region = MKCoordinateRegion(center: center, span: span)
        }
    }
}

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
    @ObservedObject var locationManager = LocationManager()
    let place = IdentifiablePlace(lat: 38.264802, long: 140.880050)
    @State private var showDetail = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment:.bottom) {
                Button(action: {
                    showDetail = false
                    print("clicked")
                }) {
                    Spacer()
                }
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenHeight, alignment: .center)
                
                Map(coordinateRegion: $locationManager.region,
                    showsUserLocation: true,
                    annotationItems: [place]) {
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
        ShopMapView()
    }
}
