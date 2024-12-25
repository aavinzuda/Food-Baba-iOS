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

//MARK: - Buttons

/// Haptic Feedback Enabled Button
struct FBButton<Label: View>: View {
    
    init(
        action: @escaping (() -> Void),
        @ViewBuilder label: (() -> Label)
    ) {
        self.action = action
        self.label = label()
    }
    
    private let action: (() -> Void)
    private let label: Label
    
    var body: some View {
        Button(action: {
            HapticManager.shared.generateNormalHapticFeedback()
            action()
        }) {
            self.label
        }
    }
}


//MARK: - Image With Bottom Price (Reusable Component)
struct ImageViewWithPrice: View {
    
    let price: Int
    let image: UIImage
    @Binding var isFavourite: Bool
    let isAdvertise: Bool
    
    var body: some View {
        Image(uiImage: self.image)
            .resizable()
            .clipShape(
                RoundedRectangle(cornerRadius: 15.0)
            )
            .overlay {
                LinearGradient(
                    colors: [.clear, .clear, .clear, .clear, .clear, .black.opacity(0.1), .black.opacity(0.6)],
                    startPoint: .bottomLeading,
                    endPoint: .topTrailing
                )
                .blur(radius: 2.0)
                .clipShape(
                    RoundedRectangle(cornerRadius: 15.0)
                )
            }
            // Favourite Button
            .overlay(alignment: .topTrailing) {
                FBButton {
                    withAnimation { self.isFavourite.toggle() }
                } label: {
                    ZStack {
                        Image(systemName: "heart")
                            .resizable()
                            .symbolVariant(.fill)
                            .frame(width: 26, height: 26)
                            .foregroundStyle(.white)
                            .opacity(isFavourite ? 1.0 : 0.0)
                            .padding([.top, .trailing], 10)
                        
                        Image(systemName: "heart")
                            .resizable()
                            .symbolVariant(self.isFavourite ? .fill : .none)
                            .frame(width: 22, height: 22)
                            .foregroundStyle(self.isFavourite ? .pink : .white)
                            .padding([.top, .trailing], 10)
                    }
                }
            }
            // Items and Discount Price
            .overlay(alignment: .bottom) {
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("ITEMS")
                            .font(.subheadline)
                            .fontWeight(.black)
                        
                        Text("AT ₹\(self.price)")
                            .font(.title3)
                            .fontWeight(.black)
                    }
                    .layoutPriority(1.0)
                    
                    Spacer()
                    
                    if self.isAdvertise {
                        HStack(spacing: 3) {
                            Rectangle()
                                .fill(.secondary.opacity(0.6))
                                .frame(width: 1.5, height: 10)
                            
                            Text("AD")
                                .font(.caption2)
                                .fontWeight(.bold)
                                .foregroundStyle(.secondary.opacity(0.8))
                        }
                    }
                }
                .padding([.horizontal, .bottom], 10)
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)
                .padding(.top)
                .background(
                    LinearGradient(
                        colors: [.clear, .black.opacity(0.1), .black.opacity(0.6), .black],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .clipShape(
                    UnevenRoundedRectangle(
                        topLeadingRadius: 0.0,
                        bottomLeadingRadius: 15.0,
                        bottomTrailingRadius: 15.0,
                        topTrailingRadius: 0.0
                    )
                )
            }
    }
}


//MARK: - Section Header View
struct SectionHeaderView: View {
    
    let name: String
    
    var body: some View {
        HStack(spacing: 3, content: {
            Text(name.uppercased())
                .font(.caption)
                .fontWeight(.medium)
                .kerning(1.2)
                .foregroundStyle(.primary)
                .layoutPriority(1.0)
            
            LinearGradient(colors: [.gray, .gray.opacity(0.7), .clear], startPoint: .leading, endPoint: .trailing)
                .frame(height: 1.0)
        })
        .padding(.horizontal)
    }
}

