//
//  HomeViewController+DataSource.swift
//  FoodBaba
//
//  Created by A. A. Vinzuda on 24/12/24.
//

import UIKit
import SwiftUI

//MARK: - TableView DataSource Methods
extension HomeViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.collectionViewSections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSection = self.collectionViewSections[section]
        
        switch currentSection {
            case .TopMost, .WhatsOnMind, .PopularBrands:
                return 1
            case .Explore:
                return self.exploreCellCollection.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentSection = self.collectionViewSections[indexPath.section]
        
        switch currentSection {
            case .TopMost:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ImagesSliderCollectionCell.identifier, for: indexPath) as? ImagesSliderCollectionCell
                else { return UITableViewCell() }
                
                cell.initialSetup()
                
                return cell
                
            case .WhatsOnMind:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: WhatsOnMindSliderCollectionCell.identifier, for: indexPath) as? WhatsOnMindSliderCollectionCell
                else { return UITableViewCell() }
                
                cell.initialSetup()
                
                return cell
                
            case .PopularBrands:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: PopularBrandsCell.identifier, for: indexPath) as? PopularBrandsCell
                else { return UITableViewCell() }
                
                cell.initialSetup()
                
                return cell
                
            case .Explore:
                guard let cell = tableView.dequeueReusableCell(withIdentifier: ExploreCell.identifier, for: indexPath) as? ExploreCell
                else { return UITableViewCell() }
                
                let model: PopularBrandModel = self.exploreCellCollection[indexPath.row]
                
                cell.initialSetup(for: model)
                
                return cell
        }
    }
}
