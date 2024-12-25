//
//  ExploreCellView.swift
//  FoodBaba
//
//  Created by A. A. Vinzuda on 25/12/24.
//

import SwiftUI

//MARK: - Explore Cell View
struct ExploreCellView: View {
    
    @State var model: PopularBrandModel
    @State private var isAnimate: Bool = false

    var body: some View {
        HStack(spacing: 15) {
            ImageViewWithPrice(
                price: model.discountPrice,
                image: model.image,
                isFavourite: $model.isFavourite,
                isAdvertise: model.isAdvertise
            )
            .frame(width: 150)
            .shadow(color: Color(uiColor: .label).opacity(0.3), radius: 7)
            
            detailsView
            
            Spacer()
        }
        .padding()
        .contextMenu(menuItems: {
            Button("Open", action: self.handleTapEvent)
            Button("\(self.model.isFavourite ? "Remove" : "Mark") Favourite", action: { self.model.toggleFavourite() })
        }, preview: {
            Image(uiImage: model.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        })
        .overlay(alignment: .topTrailing) {
            Image(systemName: "ellipsis")
                .rotationEffect(.degrees(90))
                .foregroundStyle(.secondary)
                .padding(.trailing, 10)
                .padding(.top, 15)
        }
        .onTapGesture { self.handleTapEvent() }
        .scaleEffect(x: isAnimate ? 0.9 : 1.0, y: isAnimate ? 0.9 : 1.0)
        .animation(.spring(duration: 0.2), value: self.isAnimate)
    }
    
    @ViewBuilder
    private var detailsView: some View {
        VStack(alignment: .leading, spacing: 5) {
            details
            freeDeliveryView
        }
    }
    
    @ViewBuilder
    private var details: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(model.name)
                .font(.headline)
                .fontWeight(.bold)
            
            HStack(spacing: 5) {
                Image(systemName: "star.circle.fill")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundStyle(.green)
                
                HStack(spacing: 5) {
                    Text(model.ratings+"(\(model.ratingsCount))")
                        .fontWeight(.bold)
                    
                    Circle()
                        .frame(width: 4, height: 4)
                    
                    Text(model.deliveryTime)
                        .lineLimit(1)
                        .fontWeight(.bold)
                }
                .font(.caption)
                .foregroundStyle(.primary)
            }
            
            Text(model.getKeyWordsString())
                .font(.caption)
                .fontWeight(.regular)
                .foregroundStyle(.secondary)
            
            HStack(spacing: 5) {
                Text(model.location)
                    .font(.caption)
                    .fontWeight(.regular)
                
                Circle()
                    .frame(width: 4, height: 4)
                
                Text(model.distance)
                    .font(.caption)
                    .fontWeight(.regular)
            }
            .foregroundStyle(.secondary)
        }
    }
    
    @ViewBuilder
    private var freeDeliveryView: some View {
        HStack(spacing: 5) {
            Image(systemName: "bicycle")
                .resizable()
                .frame(width: 20, height: 20)
                .symbolVariant(.circle.fill)
            
            Text("Free Delivery".uppercased())
                .font(.caption2)
                .fontWeight(.black)
        }
        .foregroundStyle(.appIconPurple)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(
            LinearGradient(
                colors: [.appIconPurple.opacity(0.2), .white],
                startPoint: .bottomLeading,
                endPoint: .topTrailing
            )
        )
        .clipShape(RoundedRectangle(cornerRadius: 20.0))
    }
    
    private func handleTapEvent() {
        self.isAnimate = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.isAnimate = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                let dataDict: [String: Any] = ["model": model, "isZoomable": true]
                NotificationCenter.default.post(name: Notification.Name("Present_Detail_Screen"), object: nil, userInfo: dataDict)
            }
        }
    }
}
