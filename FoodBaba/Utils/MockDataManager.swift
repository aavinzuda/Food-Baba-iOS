//
//  MockDataManager.swift
//  StickyApp
//
//  Created by A. A. Vinzuda on 08/12/24.
//

import UIKit

//MARK: - MockData Manager
struct MockDataManager {
    static let dishesImages: [UIImage] = {
        return (1...12).map({
            UIImage(imageLiteralResourceName: "Dish\($0)")
        })
    }()
    
    static let sweetsImages: [UIImage] = {
        return (1...2).map({
            UIImage(imageLiteralResourceName: "Sweet\($0)")
        })
    }()
    
    static let fruitImages: [UIImage] = {
        return (1...2).map({
            UIImage(imageLiteralResourceName: "Fruit\($0)")
        })
    }()
    
    static let categoriesImages: [UIImage] = {
        return (1...12).map({
            UIImage(imageLiteralResourceName: "Category\($0)")
        })
    }()
    
        //MARK: - Popular Brands Mock Data
    static func getPopularBrands() -> [PopularBrandModel] {
        return [
            .init(
                name: "Huber & Holly",
                ratings: "4.3",
                deliveryTime: "25-30 mins",
                keywords: ["Dessets", "Pizzas", "Beverages"],
                image: UIImage(resource: .dish4),
                isFavourite: false,
                location: "Ujala",
                distance: "1.9 km",
                discountPrice: 59,
                isAdvertise: true
            ),
            .init(
                name: "Gwalia Sweets & Dairy Farm",
                ratings: "4.6",
                deliveryTime: "35-40 mins",
                keywords: ["Sweets", "Thalis", "North Indian", "South Indian"],
                image: UIImage(resource: .dish1),
                isFavourite: false,
                location: "Money Plant",
                distance: "1.8 km",
                discountPrice: 159,
                isAdvertise: true
            ),
            .init(
                name: "Vipul Dudhiya Sweets & Dairy",
                ratings: "4.2",
                deliveryTime: "30-40 mins",
                keywords: ["Sweets", "Thalis", "North Indian", "South Indian"],
                image: UIImage(resource: .dish3),
                isFavourite: false,
                location: "Gota",
                distance: "1.0 km",
                discountPrice: 119,
                isAdvertise: false
            ),
            .init(
                name: "The Chocolate Room",
                ratings: "4.8",
                deliveryTime: "20-40 mins",
                keywords: ["Chocolates", "Sweets", "Australian Chocolates"],
                image: UIImage(resource: .sweet1),
                isFavourite: false,
                location: "Ognaj",
                distance: "1.2 km",
                discountPrice: 119,
                isAdvertise: false
            ),
            .init(
                name: "The Blue Oven",
                ratings: "4.3",
                deliveryTime: "25-30 mins",
                keywords: ["Dessets", "Pizzas", "Beverages"],
                image: UIImage(resource: .dish5),
                isFavourite: false,
                location: "Iscon",
                distance: "6.2 km",
                discountPrice: 99,
                isAdvertise: false
            ),
            .init(
                name: "La Pino'z Pizza",
                ratings: "4.9",
                deliveryTime: "35-40 mins",
                keywords: ["Pizzas", "Pastas", "Italian"],
                image: UIImage(resource: .category3),
                isFavourite: false,
                location: "Kargil",
                distance: "2.2 km",
                discountPrice: 99,
                isAdvertise: false
            ),
            .init(
                name: "The Amul Shop",
                ratings: "4.4",
                deliveryTime: "15-20 mins",
                keywords: ["Bakery", "Puffs", "Sweets"],
                image: UIImage(resource: .dish12),
                isFavourite: false,
                location: "Bhadaj",
                distance: "3.2 km",
                discountPrice: 99,
                isAdvertise: false
            )
        ]
    }
    
        //MARK: - Popular Brands Mock Data
    static func getWhatsOnMindCategories() -> [WhatsOnMindModel] {
        return [
            .init(name: "Paneer", image: .category1),
            .init(name: "Gujarati", image: .category2),
            .init(name: "Pizza", image: .category3),
            .init(name: "Chinese", image: .category4),
            .init(name: "Non Veg", image: .category5),
            .init(name: "Shake", image: .category6),
            .init(name: "Biriyani", image: .category7),
            .init(name: "Soup", image: .category8),
            .init(name: "Spicy", image: .category9),
            .init(name: "Salad", image: .category10),
            .init(name: "Pasta", image: .category11),
            .init(name: "Paneer Biriyani", image: .category12),
        ]
    }
}
