//
//  PopularBrandsCollectionsView.swift
//  FoodBaba
//
//  Created by A. A. Vinzuda on 25/12/24.
//

import SwiftUI


//MARK: - Popular Brands Collections View
struct PopularBrandsCollectionsView: View {
    
    let brands: [PopularBrandModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            SectionHeaderView(name: "Popular Brands")
                .padding([.top, .trailing])
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10, content: {
                    ForEach(self.brands, id: \.id) { brand in
                        PopularBrandCellView(model: brand, onTapEvent: {
                            let dataDict: [String: Any] = ["model": brand, "isZoomable": false]
                            NotificationCenter.default.post(name: Notification.Name("Present_Detail_Screen"), object: nil, userInfo: dataDict)
                        })
                        .frame(width: 140)
                    }
                    .padding(.vertical)
                    .padding(.horizontal, 5)
                })
                .padding(.horizontal)
            }
            
            self.getFooterView()
        }
    }
    
    @ViewBuilder
    private func getFooterView() -> some View {
        Text("\(MockDataManager.getPopularBrands().count * 3) restaurants to explore")
            .font(.subheadline)
            .fontWeight(.bold)
            .foregroundStyle(.primary)
            .padding([.top, .horizontal])
    }
}

//MARK: - Popular Brands Cell View
struct PopularBrandCellView: View {
    
    @State var model: PopularBrandModel
    let onTapEvent: CompletionHandler
    
    @State private var isAnimate: Bool = false
    
    var body: some View {
        VStack {
            ImageViewWithPrice(
                price: model.discountPrice,
                image: model.image,
                isFavourite: $model.isFavourite,
                isAdvertise: model.isAdvertise
            )
            .shadow(color: Color(uiColor: .label).opacity(0.3), radius: 7)
            .onTapGesture { self.handleTapEvent() }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(model.name)
                    .font(.headline)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .foregroundStyle(.primary)
                
                HStack(spacing: 5) {
                    Image(systemName: "star.circle.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundStyle(.green)
                    
                    HStack(spacing: 5) {
                        Text(model.ratings)
                            .fontWeight(.medium)
                        
                        Circle()
                            .frame(width: 4, height: 4)
                        
                        Text(model.deliveryTime)
                            .lineLimit(1)
                            .fontWeight(.medium)
                    }
                    .font(.caption)
                    .foregroundStyle(.primary)
                }
                
                Text(model.getKeyWordsString())
                    .font(.footnote)
                    .fontWeight(.regular)
                    .lineLimit(1)
                    .foregroundStyle(.secondary)
            }
            .onTapGesture { self.handleTapEvent() }
        }
        .contextMenu(menuItems: {
            Button("Open", action: self.handleTapEvent)
            Button("\(self.model.isFavourite ? "Remove" : "Mark") Favourite", action: { self.model.toggleFavourite() })
        }, preview: {
            Image(uiImage: model.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        })
        .scaleEffect(x: isAnimate ? 0.9 : 1.0, y: isAnimate ? 0.9 : 1.0)
        .animation(.spring(duration: 0.2), value: self.isAnimate)
    }
    
    private func handleTapEvent() {
        self.isAnimate = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.isAnimate = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) { self.onTapEvent() }
        }
    }
}


struct Preview: PreviewProvider {
    static var previews: some View {
        MyPreViewVC()
    }
    
    struct MyPreViewVC: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> some UIViewController {
            UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "HomeViewController")
        }
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
}
