//
//  WhatsOnMindGridView.swift
//  FoodBaba
//
//  Created by A. A. Vinzuda on 25/12/24.
//

import SwiftUI

//MARK: - What's On Your Mind Collections View
struct WhatsOnMindGridView: View {
    
    let categories: [WhatsOnMindModel]
    
    @State private var isAnimate: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            SectionHeaderView(name: "Aakash, what's on your mind?")
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 20) {
                    ForEach(categories.chunked(into: 2), id: \.self) { pair in
                        VStack(spacing: 20) {
                            ForEach(pair, id: \.id) { category in
                                getCellView(for: category)
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }
        }
    }
    
    @ViewBuilder
    private func getCellView(for category: WhatsOnMindModel) -> some View {
        VStack {
            Image(uiImage: category.image)
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
            
            Text(category.name)
                .font(.caption)
                .foregroundStyle(.primary)
        }
        .onTapGesture { self.handleTapEvent(for: category) }
    }
    
    private func handleTapEvent(for category: WhatsOnMindModel) {
        self.isAnimate = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.isAnimate = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                let dataDict: [String: Any] = [
                    "category": category,
                    "isZoomable": false
                ]
                NotificationCenter.default.post(name: Notification.Name("Present_Detail_Screen"), object: nil, userInfo: dataDict)
            }
        }
    }
}
