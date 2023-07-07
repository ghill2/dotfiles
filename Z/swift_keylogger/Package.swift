// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift_keylogger",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "swift_keylogger",
            targets: ["swift_keylogger"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "swift_keylogger",
            dependencies: []),
        .testTarget(
            name: "swift_keyloggerTests",
            dependencies: ["swift_keylogger"]),
    ]
)
