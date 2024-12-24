//
//  Untitled.swift
//  FoodBaba
//
//  Created by A. A. Vinzuda on 24/12/24.
//

import UIKit


//MARK: - Images Slider Collection TableView Cell
final class ImagesSliderCollectionCell: UITableViewCell {
    static let identifier: String = "ImagesSliderCollectionCell"
    
    func initialSetup() {
        if self.viewWithTag(101) == nil {
            let imageSliderSwiftUIView = ImagesSliderView(images: [1, 2, 3, 4, 5, 6, 7])
            let hostedView = self.hostSwitftUIView(imageSliderSwiftUIView)
            hostedView.tag = 101
        } else {
            return
        }
    }
}
