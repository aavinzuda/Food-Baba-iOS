//
//  ImagesSliderView.swift
//  FoodBaba
//
//  Created by A. A. Vinzuda on 25/12/24.
//

import SwiftUI


//MARK: - Pages TabView
struct ImagesSliderView: View {
    
    let images: [Int]
    
    @State private var selectedImageIndex: Int = 1
    
    private let randomGradientArray: [[Color]] = [
        [.blue, .brown],
        [.blue, .purple],
        [.orange, .brown],
        [.indigo, .brown],
        [.cyan, .brown],
        [.cyan, .purple],
    ]
    
    var body: some View {
        VStack(spacing: 10) {
            TabView(selection: $selectedImageIndex) {
                ForEach(0 ..< images.count, id: \.self) { image in
                    self.getImageView(at: image)
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            self.customPageControl
        }
        .animation(.spring, value: self.selectedImageIndex)
    }
    
    @ViewBuilder
    private func getImageView(at index: Int) -> some View {
        let randomColorArray = self.randomGradientArray.randomElement() ?? [.blue, .cyan]
        LinearGradient(colors: randomColorArray, startPoint: .topLeading, endPoint: .bottomTrailing)
            .clipShape(RoundedRectangle(cornerRadius: 12.0))
            .padding([.top, .horizontal])
    }
    
    @ViewBuilder
    private var customPageControl: some View {
        HStack {
            ForEach(0 ..< images.count, id: \.self) { imageIndex in
                let isActive: Bool = self.selectedImageIndex == imageIndex
                
                Circle()
                    .fill(isActive ? .black : .black.opacity(0.6))
                    .frame(width: 10, height: 20)
                    .scaleEffect(x: isActive ? 1.0 : 0.7, y: isActive ? 1.0 : 0.7)
                    .onTapGesture { self.selectedImageIndex = imageIndex }
            }
        }
    }
}