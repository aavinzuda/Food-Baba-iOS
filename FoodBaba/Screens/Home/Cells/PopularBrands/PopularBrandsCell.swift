//
//  Untitled.swift
//  FoodBaba
//
//  Created by A. A. Vinzuda on 24/12/24.
//

import UIKit

//MARK: - Popular Brands Collection TableView Cell
final class PopularBrandsCell: UITableViewCell {
    static let identifier: String = "PopularBrandsCell"
    private let brands = MockDataManager.getPopularBrands()
    
    func initialSetup() {
        if self.viewWithTag(102) == nil {
            let popularBrandsCollectionView = PopularBrandsCollectionsView(brands: self.brands)
            let hostedView = self.hostSwitftUIView(popularBrandsCollectionView)
            hostedView.tag = 102
        } else {
            return
        }
    }
}
