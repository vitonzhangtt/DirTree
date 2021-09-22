// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DirTree",
    products: [
        // Products define the executables and libraries a package produces,
        // and make them visible to other packages.
        .library(
            name: "DirTreeLib",
            type: .dynamic,
            targets: ["DirTreeLib"]),
        
        .executable(name: "DirTree",
                    targets: ["DirTree"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        
        .package(name: "swift-argument-parser", url: "https://github.com/apple/swift-argument-parser", .exact("0.4.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "DirTree",
            dependencies: [
                           .product(name: "ArgumentParser", package: "swift-argument-parser"),
                           .target(name: "DirTreeLib"),
                            ]
        ),
        .target(
            name: "DirTreeLib",
            dependencies: []
                ),
        .testTarget(
            name: "DirTreeTests",
            dependencies: ["DirTreeLib"]),
    ]
)
