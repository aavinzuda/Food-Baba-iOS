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
    @State private var index: Int = 1
    
    private let timer = Timer.publish(every: 4, on: .main, in: .common).autoconnect()
    
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
            .onReceive(timer, perform: { _ in
                index = index < images.count ? index + 1 : 1
                self.selectedImageIndex = images[index - 1]
            })
            
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
                    .fill(isActive ? Color.primary : Color.primary.opacity(0.6))
                    .frame(width: 10, height: 20)
                    .scaleEffect(x: isActive ? 1.0 : 0.7, y: isActive ? 1.0 : 0.7)
                    .onTapGesture { self.selectedImageIndex = imageIndex }
            }
        }
    }
}
