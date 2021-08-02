//
//  LocationManager.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/08/03.
//

import Foundation
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
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            region = MKCoordinateRegion(center: center, span: span)
            
            let places = Shop.data.map() { shop in
                CLLocation(latitude: shop.latitude, longitude: shop.longitude)
            }
            for place in places {
                print(place.distance(from: CLLocation(latitude: center.latitude, longitude: center.longitude)))
            }
        }
    }
    
    
}
