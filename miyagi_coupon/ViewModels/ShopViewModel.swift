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

class ShopViewModel: ObservableObject {
    let timeInterval: Double = 60.0
    @Published public var nearByShops: [Shop] = []
    @Published public var distances: [String:Double] = [:]
    @ObservedObject private var locationManager = LocationManager()
    private var distanceThreshold: Double = 2000.0
    @Published private(set) var candidateShops: [Shop] = []
    
    init() {
        Timer.scheduledTimer(withTimeInterval: timeInterval, repeats: true) { [self] timer in
            // register notifications
            resetCandidates()
            
            // set nearby shops
            
            // 
        }
           
    }
    
    func resetCandidates() {
        let shopkey = Shop.keys
        let predicate = shopkey.latitude > 30
        _ = Amplify.API.query(request: .paginatedList(Shop.self, where: predicate, limit: 1000)) { event in
                switch event {
                    case .failure(let error):
                        print(error.errorDescription)
                        return
                    case .success(let result):
                        switch result {
                        case .failure(let resultError):
                            print(resultError.errorDescription)
                            return
                        case .success(let shops):
                            self.candidateShops.removeAll()
                            for shop in shops {
                                if self.locationManager.computeDistance(to: shop) < self.distanceThreshold {
                                    self.candidateShops.append(shop)
                                }
                            }
                    }
                }
        }
    }
}
