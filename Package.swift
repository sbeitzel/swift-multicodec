// swift-tools-version:6.2
//===----------------------------------------------------------------------===//
//
// This source file is part of the swift-libp2p open source project
//
// Copyright (c) 2022-2025 swift-libp2p project authors
// Licensed under MIT
//
// See LICENSE for license information
// See CONTRIBUTORS for the list of swift-libp2p project authors
//
// SPDX-License-Identifier: MIT
//
//===----------------------------------------------------------------------===//

import PackageDescription

let package = Package(
    name: "swift-multicodec",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v18),
        .watchOS(.v26),
        .tvOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .executable(
            name: "update-codecs",
            targets: ["Updater"]
        ),
        .library(
            name: "Multicodec",
            targets: ["Multicodec"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/sbeitzel/swift-varint.git", branch: "feature/update_for_swift_6_2")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .executableTarget(
            name: "Updater",
            dependencies: []
        ),
        .target(
            name: "Multicodec",
            dependencies: [
                .product(name: "VarInt", package: "swift-varint")
            ]
        ),
        .testTarget(
            name: "MulticodecTests",
            dependencies: ["Multicodec"]
        ),
    ]
)
