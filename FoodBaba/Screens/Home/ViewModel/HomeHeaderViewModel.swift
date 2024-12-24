//
//  HomeHeaderView.swift
//  FoodBaba
//
//  Created by A. A. Vinzuda on 24/12/24.
//


import SwiftUI

final class HomeHeaderViewViewModel: ObservableObject {
    
    static let shared: HomeHeaderViewViewModel = .init()
    
    private init() {}
    
    let homeHeaderHeight: CGFloat = 180.0
    @Published var headerPhase: HeaderPhase = .FullyVisible
    
    @Published var currentLocationShortName: String = "Gota"
    @Published var currentLocationFullName: String = "Gota, Ahmedabad, Gujarat 382481, India"
}
