# StinkyKeyboard 🪰

Keyboard avoidance made easy.

## Installation

StinkyKeyboard is distributed using [Swift Package Manager](https://swift.org/package-manager). To install it into a project, simply add it as a dependency within your Package.swift manifest:

```swift
let package = Package(
    ...
    dependencies: [
        .package(url: "https://github.com/lucamegh/StinkyKeyboard", from: "1.0.0")
    ],
    ...
)
```

## Usage

1. Wrap your view controller in a keyboard avoiding view controller:
```swift
let loginVC = KeyboardAvoidingViewController(content: LoginViewController())
navigationController.pushViewController(loginVC, animated: true)
```

2. There's no step 2!
