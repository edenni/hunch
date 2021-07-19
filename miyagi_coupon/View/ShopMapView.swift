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

struct ShopMapView: View {
    @ObservedObject var locationManager = LocationManager()

    var body: some View {
        Map(coordinateRegion: $locationManager.region, showsUserLocation: true)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ShopMapView_Previews: PreviewProvider {
    static var previews: some View {
        ShopMapView()
    }
}
