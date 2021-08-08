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
    private let locationManager = CLLocationManager()
    private let shopViewModel = ShopViewModel()
    
    static var shared = LocationManager()
    
    override init() {
        super.init()
        locationManager.requestAlwaysAuthorization()
//        manager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locations.last.map {
            let center = CLLocationCoordinate2D(latitude: $0.coordinate.latitude, longitude: $0.coordinate.longitude)
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            region = MKCoordinateRegion(center: center, span: span)
        }
    }
    
    func computeAllDistance(to shops: [Shop]) -> [Double] {
//      print distances from each shop to current location
        let places = shops.map() { shop in
            CLLocation(latitude: shop.latitude!, longitude: shop.longitude!)
        }
        
        return places.map { place in
            place.distance(from: CLLocation(latitude: region.center.latitude,
                                                  longitude: region.center.longitude))
        }
    }
    
    func computeDistance(to shop: Shop) -> Double {
        CLLocation(latitude: shop.latitude!, longitude: shop.longitude!)
            .distance(from:
                        CLLocation(latitude: region.center.latitude,
                                   longitude: region.center.longitude))
    }
}
