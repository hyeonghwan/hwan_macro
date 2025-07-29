// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "HwanMacros",
    platforms: [.macOS(.v10_15), .iOS(.v14), .tvOS(.v13), .watchOS(.v6), .macCatalyst(.v13)],
    products: [
        .library(
            name: "HwanMacros",
            targets: ["HwanMacros"]
        ),
        .executable(
            name: "HwanMacrosClient",
            targets: ["HwanMacrosClient"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/swiftlang/swift-syntax.git", exact: "510.0.2"),
    ],
    targets: [
        .macro(
            name: "HyeongCro",
            dependencies: [
                .target(name: "SwiftSyntaxWrapper")
            ]
        ),
        .target(name: "HwanMacros", dependencies: ["HyeongCro"]),
        
        .executableTarget(
            name: "HwanMacrosClient",
            dependencies: ["HwanMacros"]
        ),
        
        .testTarget(
            name: "HwanMacrosTests",
            dependencies: [
                "HyeongCro",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax"),
            ]
        ),
        
        .binaryTarget(name: "SwiftSyntaxWrapper", path: "Sources/XCFramework/SwiftSyntaxWrapper.xcframework")
    ]
)
