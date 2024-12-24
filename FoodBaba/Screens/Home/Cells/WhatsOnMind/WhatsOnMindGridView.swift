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
    
    private let gridItems: [GridItem] = [
        .init(.fixed(130), spacing: 5),
        .init(.fixed(130), spacing: 5),
    ]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            SectionHeaderView(name: "Aakash, what's on your mind?")
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: gridItems, spacing: 20, content: {
                    ForEach(self.categories, id: \.id) { category in
                        self.getCellView(for: category)
                    }
                })
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
    }
}
