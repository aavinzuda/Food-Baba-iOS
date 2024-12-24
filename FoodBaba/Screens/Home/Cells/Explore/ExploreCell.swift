//
//  ExploreCell.swift
//  FoodBaba
//
//  Created by A. A. Vinzuda on 24/12/24.
//


import UIKit

//MARK: - Explore More TableView Cell
final class ExploreCell: UITableViewCell {
    
    static let identifier: String = "ExploreCell"
    
    func initialSetup(for model: PopularBrandModel) {
        if self.viewWithTag(105) == nil {
            let exploreCellSwiftUIView = ExploreCellView(model: model)
            let hostedView = self.hostSwitftUIView(exploreCellSwiftUIView)
            hostedView.tag = 105
        } else {
            return
        }
    }
}
