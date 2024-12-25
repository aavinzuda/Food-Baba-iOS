//
//  Models.swift
//  FoodBaba
//
//  Created by A. A. Vinzuda on 24/12/24.
//

import UIKit

//MARK: - TypeAlias
typealias CompletionHandler = (() -> Void)


//MARK: - HeaderPhase
enum HeaderPhase {
    case NotVisible, HalfVisible, FullyVisible
    
    var opacity: CGFloat {
        switch self {
            case .NotVisible, .HalfVisible:
                return 0.0
            case .FullyVisible:
                return 1.0
        }
    }
}


//MARK: - Food Section
enum FoodSection: CaseIterable {
    case TopMost
    case WhatsOnMind
    case PopularBrands
    case Explore
}


//MARK: - Popular Brand Model
struct PopularBrandModel {
    let id: UUID
    let name: String
    let ratings: String
    let ratingsCount: Int
    let deliveryTime: String
    let keywords: [String]
    let image: UIImage
    var isFavourite: Bool
    
    let location: String
    let distance: String
    let discountPrice: Int
    let isAdvertise: Bool
    
    init(
        id: UUID = .init(),
        name: String,
        ratings: String,
        ratingsCount: Int = Int.random(in: 10...999),
        deliveryTime: String,
        keywords: [String],
        image: UIImage,
        isFavourite: Bool = false,
        location: String,
        distance: String,
        discountPrice: Int,
        isAdvertise: Bool = false
    ) {
        self.id = id
        self.name = name
        self.ratings = ratings
        self.ratingsCount = ratingsCount
        self.deliveryTime = deliveryTime
        self.keywords = keywords
        self.image = image
        self.isFavourite = isFavourite
        self.location = location
        self.distance = distance
        self.discountPrice = discountPrice
        self.isAdvertise = isAdvertise
    }
    
    func getKeyWordsString() -> String {
        return self.keywords.joined(separator: ", ")
    }
    
    mutating func toggleFavourite() {
        self.isFavourite = self.isFavourite ? false : true
    }
}


//MARK: - What's On Your Mind Model
struct WhatsOnMindModel: Hashable {
    let id: UUID
    let name: String
    let image: UIImage
    
    init(
        id: UUID = .init(),
        name: String,
        image: UIImage
    ) {
        self.id = id
        self.name = name
        self.image = image
    }
}
