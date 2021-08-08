//
//  ShopListViewModel.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/07/17.
//

import Foundation
import SwiftUI
import Combine
import Amplify

final class ShopListViewModel: ObservableObject {
    
    @ObservedObject private var locationManager = LocationManager()
    
    init() {
        resetCandidates()
        
    }
    
    
}
