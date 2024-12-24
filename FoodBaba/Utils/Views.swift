//
//  Views.swift
//  StickyApp
//
//  Created by A. A. Vinzuda on 24/12/24.
//

import SwiftUI

//MARK: - Gradient Views
struct BGGradientView: View {
    
    private let colors: [Color] = [
        .init(.appIconOrange),
        .init(.appIconPurple),
    ]
    
    var body: some View {
        LinearGradient(colors: self.colors, startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}
