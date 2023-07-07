// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "modules",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(name: "modules", type: .dynamic, targets: ["modules"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(url: "https://github.com/pvieito/PythonKit.git", .branch("master")),
        .package(url: "https://github.com/SwiftyJSON/SwiftyJSON.git", from: "4.0.0"),
        // .package(url: "https://github.com/iwill/generic-json-swift", .branch("master")),
        
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "modules",
            dependencies: ["PythonKit"]),
        .testTarget(
            name: "modulesTests",
            dependencies: ["modules"]),
    ]
)
