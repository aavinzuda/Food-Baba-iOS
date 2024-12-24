//
//  HomeViewController+Delegate.swift
//  FoodBaba
//
//  Created by A. A. Vinzuda on 24/12/24.
//

import UIKit
import SwiftUI

//MARK: - TableView Delegate Methods
extension HomeViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let currentSection = self.collectionViewSections[indexPath.section]
        
        switch currentSection {
            case .TopMost:
                return 170
            case .WhatsOnMind:
                return 350
            case .PopularBrands:
                return 330
            case .Explore:
                return 200
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.alpha = 0.0
        if indexPath.section == self.collectionViewSections.count - 1 {
            UIView.animate(
                withDuration: 1.0,
                delay: 0.03 * Double(indexPath.row),
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0.5,
                options: .curveEaseInOut,
                animations: {
                    cell.alpha = 1.0
                }
            )
        } else {
            UIView.animate(
                withDuration: 1.0,
                delay: 0.5,
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0.5,
                options: .curveEaseInOut,
                animations: {
                    cell.alpha = 1.0
                }
            )
        }
    }
}
