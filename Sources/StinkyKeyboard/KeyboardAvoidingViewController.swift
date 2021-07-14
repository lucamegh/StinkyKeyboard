/**
 * StinkyKeyboard
 * Copyright (c) Luca Meghnagi 2021
 * MIT license, see LICENSE file for details
 */

import UIKit
import UIKitHelpers

public final class KeyboardAvoidingViewController<Content: UIViewController>: UIViewController {
    
    public let content: Content
        
    private var bottomConstraint: NSLayoutConstraint?
    
    private lazy var keyboardObserver = KeyboardObserver()
    
    public init(content: Content) {
        self.content = content
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func loadView() {
        super.loadView()
        
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)
        
        var constraints = [
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        bottomConstraint = contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        constraints.append(bottomConstraint!)
        NSLayoutConstraint.activate(constraints)
        
        install(content, in: contentView)
        
        keyboardObserver.observe { [unowned self] keyboard in
           bottomConstraint?.constant = -keyboard.height
           keyboard.animateAlong(view.layoutIfNeeded)
        }
    }
}
