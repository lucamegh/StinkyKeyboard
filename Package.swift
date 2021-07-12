// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "StinkyKeyboard",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "StinkyKeyboard",
            targets: ["StinkyKeyboard"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/lucamegh/UIKitHelpers", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "StinkyKeyboard",
            dependencies: ["UIKitHelpers"]
        ),
        .testTarget(
            name: "StinkyKeyboardTests",
            dependencies: ["StinkyKeyboard"]
        )
    ]
)
