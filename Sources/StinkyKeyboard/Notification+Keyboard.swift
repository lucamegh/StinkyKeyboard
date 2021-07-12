/**
 * StinkyKeyboard
 * Copyright (c) Luca Meghnagi 2021
 * MIT license, see LICENSE file for details
 */

import UIKit

extension Notification {
    
    var keyboardHeight: CGFloat {
        keyboardFrameEnd.height
    }
    
    var keyboardAnimation: Keyboard.Animation {
        Keyboard.Animation(
            duration: keyboardAnimationDuration,
            curve: keyboardAnimationCurve
        )
    }
    
    private var keyboardFrameEnd: CGRect {
        userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
    }
    
    private var keyboardAnimationDuration: TimeInterval {
        userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval ?? 0
    }
    
    private var keyboardAnimationCurve: UIView.AnimationCurve {
        let rawValue = userInfo?[UIResponder.keyboardAnimationCurveUserInfoKey] as? Int
        return rawValue.flatMap(UIView.AnimationCurve.init) ?? .linear
    }
}
