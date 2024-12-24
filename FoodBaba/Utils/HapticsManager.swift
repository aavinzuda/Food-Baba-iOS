//
//  HapticsManager.swift
//  StickyApp
//
//  Created by A. A. Vinzuda on 24/12/24.
//

import UIKit

final class HapticManager {
    
    static let shared: HapticManager = .init()
    
    //It lets you allow to Get Specific type of Haptic Feedback.
    func generateHapticFeedback(_ style: UIImpactFeedbackGenerator.FeedbackStyle, intensity: CGFloat) {
        let impactHaptic = UIImpactFeedbackGenerator(style: style)
        impactHaptic.impactOccurred(intensity: intensity)
    }
    
    //It lets you generate a normal Haptic Feedback.
    func generateNormalHapticFeedback() {
        let haptic = UISelectionFeedbackGenerator()
        haptic.prepare()
        haptic.selectionChanged()
    }
    
    //It lets you generate a Notification Type Haptic Feedback.
    func generateNotificationHapticFeedback(_ type: UINotificationFeedbackGenerator.FeedbackType) {
        let haptic = UINotificationFeedbackGenerator()
        haptic.prepare()
        haptic.notificationOccurred(type)
    }
}
