/**
 * StinkyKeyboard
 * Copyright (c) Luca Meghnagi 2021
 * MIT license, see LICENSE file for details
 */

import UIKit

struct Keyboard {
    
    let height: CGFloat
    
    private let animation: Animation
    
    init(height: CGFloat, animation: Animation) {
        self.height = height
        self.animation = animation
    }
    
    func animateAlong(_ animations: @escaping () -> Void) {
        UIView.animate(
            withDuration: animation.duration,
            delay: 0,
            options: animation.options,
            animations: animations,
            completion: nil
        )
    }
}

extension Keyboard {
    
    init(notification: Notification) {
        self.init(
            height: notification.keyboardHeight,
            animation: notification.keyboardAnimation
        )
    }
}

extension Keyboard {
    
    struct Animation {
        
        fileprivate var options: UIView.AnimationOptions {
            let rawValue = UInt(curve.rawValue << 16)
            return UIView.AnimationOptions(rawValue: rawValue)
        }
        
        fileprivate let duration: TimeInterval
        
        fileprivate let curve: UIView.AnimationCurve
        
        init(duration: TimeInterval, curve: UIView.AnimationCurve) {
            self.duration = duration
            self.curve = curve
        }
    }
}
