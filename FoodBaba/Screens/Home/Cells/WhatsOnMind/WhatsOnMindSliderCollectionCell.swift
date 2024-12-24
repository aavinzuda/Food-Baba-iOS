//
//  WhatsOnMindSliderCollectionCell.swift
//  FoodBaba
//
//  Created by A. A. Vinzuda on 24/12/24.
//

import UIKit

//MARK: - What's On Mind Collection TableView Cell
final class WhatsOnMindSliderCollectionCell: UITableViewCell {
    static let identifier: String = "WhatsOnMindSliderCollectionCell"
    
    func initialSetup() {
        if self.viewWithTag(103) == nil {
            let whatsOnMindGridView = WhatsOnMindGridView(categories: MockDataManager.getWhatsOnMindCategories())
            
            let hostedView = self.hostSwitftUIView(whatsOnMindGridView)
            hostedView.tag = 103
        } else {
            return
        }
    }
}
