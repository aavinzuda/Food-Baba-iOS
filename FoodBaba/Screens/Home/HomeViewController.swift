//
//  HomeViewController.swift
//  FoodBaba
//
//  Created by A. A. Vinzuda on 24/12/24.
//

import UIKit
import SwiftUI

//MARK: - Home ViewController
final class HomeViewController: UIViewController {
    
    @IBOutlet private weak var headerView: UIView!
    @IBOutlet private weak var homeTableView: UITableView!
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var headerViewTopConstraint: NSLayoutConstraint!
    
    private var topHeaderView: UIView!
    
    let collectionViewSections: [FoodSection] = FoodSection.allCases
    
    var exploreCellCollection: [PopularBrandModel] = {
        let arrays = [MockDataManager.getPopularBrands().shuffled(),
                      MockDataManager.getPopularBrands().shuffled(),
                      MockDataManager.getPopularBrands().shuffled()]
        
        let newArray = arrays.flatMap { $0 }
        
        return newArray
    }()
    
    private var lastContentOffset: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTopHeaderView()
        self.setupHeaderView()
        self.setupTableView()
        NotificationCenter.default.addObserver(self, selector: #selector(self.didTapOnCell), name: Notification.Name("Present_Detail_Screen"), object: nil)
    }
    
        /// HeaderView Setup.
    private func setupHeaderView() {
        let headerView = HomeHeaderView()
        let headerHostingVC = FBHostingViewController(headerView)
        guard let headerHostedView = headerHostingVC.view else { return }
        headerHostedView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addChild(headerHostingVC)
        
        self.headerView.addSubview(headerHostedView)
        
        NSLayoutConstraint.activate([
            headerHostedView.topAnchor.constraint(equalTo: self.headerView.topAnchor),
            headerHostedView.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor),
            headerHostedView.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor),
            headerHostedView.bottomAnchor.constraint(equalTo: self.headerView.bottomAnchor),
        ])
    }
    
        /// TableView Setup.
    private func setupTableView() {
        self.homeTableView.dataSource = self
        self.homeTableView.delegate = self
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(self.handleRefreshAction), for: .valueChanged)
        self.homeTableView.refreshControl = refreshControl
    }
    
        /// Top Header View.
    private func setupTopHeaderView() {
        self.topHeaderView = .init()
        self.topHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        self.topHeaderView.backgroundColor = .systemBackground
        self.topHeaderView.alpha = 0.0
        self.topHeaderView.layer.shadowColor = UIColor(resource: .shadow).withAlphaComponent(0.6).cgColor
        self.topHeaderView.layer.shadowOpacity = 0.8
        self.topHeaderView.layer.shadowRadius = 10
        
        self.view.addSubview(self.topHeaderView)
        
        NSLayoutConstraint.activate([
            self.topHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.topHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.topHeaderView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.topHeaderView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
        ])
    }
    
        /// Refresh Action Method.
    @objc
    private func handleRefreshAction(_ sender: UIRefreshControl) {
        HapticManager.shared.generateHapticFeedback(.heavy, intensity: 1.0)
        
        self.exploreCellCollection.shuffle()
        
        let firstRowIndexPath = IndexPath(row: 0, section: 0)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            UIView.animate(withDuration: 1.0) {
                self.homeTableView.reloadData()
                self.homeTableView.scrollToRow(at: firstRowIndexPath, at: .top, animated: true)
            } completion: { _ in
                self.homeTableView.refreshControl?.endRefreshing()
            }
        }
    }
    
    @objc
    private func didTapOnCell(_ notification: Notification) {
        guard let userInfo = notification.userInfo else { return }
        
        if let model = userInfo["model"] as? PopularBrandModel,
           let isZoomable = userInfo["isZoomable"] as? Bool {
            self.presentDetailVC(for: model, isZoomable: isZoomable)
            return
        }
        
        if let model = userInfo["category"] as? WhatsOnMindModel {
            self.presentDetailVCForCategory(for: model)
            return
        }
    }
    
    /// Presents a `Detailed Screen` for `Popular Brands` and `Explore Items`.
    private func presentDetailVC(for model: PopularBrandModel, isZoomable: Bool) {
        guard let detailVC = UIStoryboard.MainSB.getViewController(for: "DetailViewController") as? DetailViewController else { return }
        
        detailVC.setup(for: model)
        
        if isZoomable {
            if #available(iOS 18.0, *) {
                detailVC.preferredTransition = .zoom(sourceViewProvider: { context in
                    guard let index = self.exploreCellCollection.firstIndex(where: { $0.id == model.id })
                    else { return self.view }
                    
                    let totalSections = self.homeTableView.numberOfSections
                    let indexPath = IndexPath(row: index, section: totalSections - 1)
                    guard let cell = self.homeTableView.cellForRow(at: indexPath) as? ExploreCell else { return self.view }
                    
                    return cell.contentView
                })
            } else {
                detailVC.modalTransitionStyle = .crossDissolve
                detailVC.modalPresentationStyle = .overFullScreen
            }
        } else {
            detailVC.modalTransitionStyle = .crossDissolve
            detailVC.modalPresentationStyle = .overFullScreen
        }
        
        self.present(detailVC, animated: true)
    }
    
    /// Presents a `Detailed Screen` for `Category`.
    private func presentDetailVCForCategory(for category: WhatsOnMindModel) {
        guard let detailVC = UIStoryboard.MainSB.getViewController(for: "DetailViewController") as? DetailViewController else { return }
        
        detailVC.setup(for: category)
        
        detailVC.modalTransitionStyle = .crossDissolve
        detailVC.modalPresentationStyle = .overFullScreen
        
        self.present(detailVC, animated: true)
    }
}


    //MARK: - ScrollView Delegate Methods
extension HomeViewController: UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.lastContentOffset = scrollView.contentOffset.y
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let currentOffset = scrollView.contentOffset.y
        let delta = currentOffset - self.lastContentOffset
        
        if delta > 0 {
            
                /// Scrolling up - Hiding the header.
            self.swipeDownAnimation()
            
        } else if delta < 0 {
            
                /// Scrolling down - Showing the header.
            self.swipeUpAnimation()
        }
    }
}


    //MARK: - Header View Animation Methods
extension HomeViewController {
    
    private func swipeDownAnimation() {
        UIView.animate(withDuration: 0.2) {
            self.headerViewTopConstraint.constant = -self.headerView.bounds.height
            self.headerView.alpha = 0.0
            self.topHeaderView.alpha = 1.0
            self.view.layoutIfNeeded()
        }
    }
    
    private func swipeUpAnimation() {
        UIView.animate(withDuration: 0.5) {
            self.topHeaderView.alpha = 0.0
            self.headerViewTopConstraint.constant = 0
            self.headerView.alpha = 1.0
            self.headerView.transform = .identity
            self.view.layoutIfNeeded()
        }
    }
}


//MARK: - Preview
struct HomeViewController_Preview: PreviewProvider {
    static var previews: some View {
        Self.getUIViewControllerRepresentable(
            for: UIStoryboard.MainSB.getViewController(for: "HomeViewController")
        )
        .ignoresSafeArea()
    }
}
