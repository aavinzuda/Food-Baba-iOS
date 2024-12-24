//
//  FBHostingViewController.swift
//  StickyApp
//
//  Created by A. A. Vinzuda on 24/12/24.
//

import UIKit
import SwiftUI


final class FBHostingViewController<T>: UIViewController where T: View {
    
    private let swiftUIView: T

    //MARK: - Initializers
    init(_ view: T) {
        self.swiftUIView = view
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - View LifeCycle Events
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hostSwiftUIView()
    }
}


//MARK: - Helper Methods
extension FBHostingViewController {
    
    private func hostSwiftUIView() {
        let hostingVC = UIHostingController<T>(rootView: self.swiftUIView)
        guard let hostedView = hostingVC.view else { return }
        self.addChild(hostingVC)
        
        hostedView.translatesAutoresizingMaskIntoConstraints = false
        hostedView.backgroundColor = .clear
        hostedView.frame = self.view.bounds
        
        self.view.addSubview(hostedView)
        
        NSLayoutConstraint.activate([
            hostedView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            hostedView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            hostedView.topAnchor.constraint(equalTo: self.view.topAnchor),
            hostedView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
        ])
    }
}


extension UIViewController {
    
    func addGradientBackground() {
        let gradientBGView = BGGradientView()
        let gradientBGController = FBHostingViewController(gradientBGView)
        self.addChild(gradientBGController)
        
        if let gradientView = gradientBGController.view {
            self.view.insertSubview(gradientView, at: 0)
        }
    }
}
