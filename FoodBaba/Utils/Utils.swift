//
//  Utils.swift
//  StickyApp
//
//  Created by A. A. Vinzuda on 24/12/24.
//

import SwiftUI

//MARK: - UIView Representable
private struct UIViewRepresentableView: UIViewRepresentable {
    
    init(_ uiView: UIView) {
        self.uiView = uiView
    }
    
    private var uiView: UIView
    
    func makeUIView(context: Context) -> some UIView {
        return self.uiView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}


//MARK: - UIViewController Representable
private struct UIViewControllerRepresentableView: UIViewControllerRepresentable {
    
    init(_ uiViewController: UIViewController) {
        self.uiViewController = uiViewController
    }
    
    private var uiViewController: UIViewController
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return self.uiViewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}


//MARK: - Helper Methods
extension PreviewProvider {
    
        /// Returns an Instance of `SwiftUI Compatible View` from the `UIView`.
    static func getUIViewRepresentable(for uiView: UIView) -> some View {
        return UIViewRepresentableView(uiView)
    }
    
        /// Returns an Instance of `SwiftUI Compatible View` from the `UIViewController`.
    static func getUIViewControllerRepresentable(for uiViewController: UIViewController) -> some View {
        return UIViewControllerRepresentableView(uiViewController)
    }
}


//MARK: - UIStoryboard Extension
extension UIStoryboard {
    
    static let MainSB: UIStoryboard = .init(name: "Main", bundle: nil)

    /// Returns an UIViewController specified by an identifier.
    @discardableResult
    func getViewController(for viewControllerIdentifier: String) -> UIViewController {
        self.instantiateViewController(withIdentifier: viewControllerIdentifier)
    }
}
