//
//  ShopListViewModel.swift
//  miyagi_coupon
//
//  Created by EdenN0 on 2021/07/17.
//

import Foundation
import SwiftUI
import Combine

final class ShopListViewModel: ObservableObject {
    @Published private(set) var shops: [Shop] = []
    
    enum Input {
        case onAppear
    }
    
    func apply(_ input: Input) {
        switch input {
        case .onAppear: onAppearSubject.send(())
        }
    }
    
    private let onAppearSubject = PassthroughSubject<Void, Never>()
}
