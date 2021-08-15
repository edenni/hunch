//
//  DistanceManager.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/08/08.
//

import Foundation
import Combine
import SwiftUI
import Amplify

// move to appstate
final class ShopViewModel: ObservableObject {
    let timeInterval: Double = 60.0
    @Published public var nearByShops: [Shop] = []
    @Published public var distances: [String:Double] = [:]
    @ObservedObject private var locationManager: LocationManager
    private var distanceThreshold: Double = 1000.0
    private var cancellable: AnyCancellable? = nil
    
    static var shared = ShopViewModel()
    
    private init() {
        locationManager = LocationManager.shared
        cancellable = mission()
        
        Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { [self] timer in
            cancellable = mission()
        }
    }
    
    func mission() -> AnyCancellable {
        self.nearByShops.removeAll()
        return resetCandidates()
            .sink(receiveCompletion: {
                _ in
            }, receiveValue: { shops in
                DispatchQueue.main.async {
                    for shop in shops {
                        if self.locationManager.computeDistance(to: shop) < 1000 {
                            self.nearByShops.append(shop)
                        }
                        // register shops notifications
                        NotificationManager.shared.scheduleNotification(shop: shop)
                    }
                }
            })
    }
    
    func resetCandidates() -> Future<[Shop], Error> {
        return Future { promise in
            let shopkey = Shop.keys
            let predicate = shopkey.latitude > 30
            var resultList: [Shop] = []
            
            Amplify.API.query(request: .paginatedList(Shop.self, where: predicate, limit: 1000)) { event in
                switch event {
                    case .failure(let error):
                        promise(.failure(error))
                        return
                    case .success(let result):
                        switch result {
                        case .failure(let resultError):
                            promise(.failure(resultError))
                        case .success(let shops):
                            for shop in shops {
                                let d = self.locationManager.computeDistance(to: shop)
                                if d < self.distanceThreshold {
                                    resultList.append(shop)
                                }
                            }
                            promise(.success(resultList))
                        }
                }
            }
        }
    }
}
