/**
 * StinkyKeyboard
 * Copyright (c) Luca Meghnagi 2021
 * MIT license, see LICENSE file for details
 */

import Combine
import UIKit

class KeyboardObserver {
    
    private var cancellables = Set<AnyCancellable>()
    
    func observe(_ handler: @escaping (Keyboard) -> Void) {
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .map(Keyboard.init)
            .sink(receiveValue: handler)
            .store(in: &cancellables)
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { notification in
                Keyboard(height: 0, animation: notification.keyboardAnimation)
            }
            .sink(receiveValue: handler)
            .store(in: &cancellables)
    }
}
