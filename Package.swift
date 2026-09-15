// swift-tools-version:5.9
// Binary distribution of the Fedo SDK (https://getfedo.com). url/checksum updated by the release script.
import PackageDescription

let package = Package(
    name: "Fedo",
    platforms: [.iOS(.v16)],
    products: [
        .library(name: "FedoKit", targets: ["FedoKit"]),
    ],
    targets: [
        .binaryTarget(
            name: "FedoKit",
            url: "https://github.com/getfedo/fedo-ios/releases/download/0.3.0-beta.1/FedoKit.xcframework.zip",
            checksum: "eacdaf1cc9dbe9076cc8a2908cbe95c99d0b3b41328aeaa1057a3803a8553e9f"
        ),
    ]
)
