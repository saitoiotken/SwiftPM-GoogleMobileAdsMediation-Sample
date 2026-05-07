// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GoogleMobileAdsMediationFluct",
    platforms: [.iOS(.v13)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "GoogleMobileAdsMediationFluct",
            targets: ["GoogleMobileAdsMediationFluct"]
        ),
    ],
    dependencies: [
        .package(
          url: "https://github.com/voyagegroup/FluctSDK-iOS-Swift-Package.git",
          exact: "6.42.1"
        ),
        .package(
          url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git",
          from: "13.3.0"
        ),
      ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
        name: "GoogleMobileAdsMediationFluct",
        dependencies: [
        .product(name: "FluctSDK", package: "FluctSDK-iOS-Swift-Package"),
        .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
        ],
        publicHeadersPath: "include"
        ),
        .testTarget(
            name: "GoogleMobileAdsMediationFluctTests",
            dependencies: ["GoogleMobileAdsMediationFluct",
                           .product(name: "FluctSDK", package: "FluctSDK-iOS-Swift-Package"),
                           .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads")
                          ]
        ),
    ]
)
