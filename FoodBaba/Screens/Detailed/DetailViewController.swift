//
//  DetailViewController.swift
//  FoodBaba
//
//  Created by A. A. Vinzuda on 24/12/24.
//

import UIKit


final class DetailViewController: UIViewController {
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var subTitleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func setup(for model: PopularBrandModel) {
        DispatchQueue.main.async {
            self.imageView.image = model.image
            self.titleLabel.text = model.name
            self.subTitleLabel.text = model.getKeyWordsString()
        }
    }
    
    func setup(for category: WhatsOnMindModel) {
        DispatchQueue.main.async {
            self.imageView.image = category.image
            self.titleLabel.text = category.name
            self.subTitleLabel.isHidden = true
        }
    }
    
    @IBAction func didTapBackButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
