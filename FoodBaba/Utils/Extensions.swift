//
//  Extensions.swift
//  StickyApp
//
//  Created by A. A. Vinzuda on 24/12/24.
//

import UIKit
import SwiftUI


//MARK: - UITableViewCell
extension UITableViewCell {
    
    /// Hosts a SwiftUI View into the Cell's ContentView.
    @discardableResult
    func hostSwitftUIView<Content: View>(_ swiftUIView: Content) -> UIView {
        let hostingVC = UIHostingController(rootView: swiftUIView)
        guard let hostedView = hostingVC.view
        else { return .init() }
        hostedView.backgroundColor = .clear
        hostedView.translatesAutoresizingMaskIntoConstraints = false
        
        self.contentView.addSubview(hostedView)
        
        NSLayoutConstraint.activate([
            hostedView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            hostedView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            hostedView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            hostedView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
        ])
        
        return hostedView
    }
}

//MARK: - UIView
extension UIView {
    
    /// Hosts a SwiftUI View into an UIView.
    @discardableResult
    func getHostedSwitftUIView<Content: View>(_ swiftUIView: Content) -> UIView {
        let hostingVC = UIHostingController(rootView: swiftUIView)
        guard let hostedView = hostingVC.view
        else { return UIView() }
        
        hostedView.backgroundColor = .clear
        hostedView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(hostedView)
        
        NSLayoutConstraint.activate([
            hostedView.topAnchor.constraint(equalTo: self.topAnchor),
            hostedView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hostedView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            hostedView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
        
        return hostedView
    }
}
