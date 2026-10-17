// swift-tools-version:5.9
// Binary distribution of the Fedo SDK (https://getfedo.com). url/checksum updated by the release script.
import PackageDescription

let package = Package(
    name: "Fedo",
    platforms: [.iOS(.v17)],
    products: [
        .library(name: "FedoKit", targets: ["FedoKit"]),
    ],
    targets: [
        .binaryTarget(
            name: "FedoKit",
            url: "https://github.com/getfedo/fedo-ios/releases/download/0.4.0/FedoKit.xcframework.zip",
            checksum: "9e5cf2ec7c92176c95c69abefee22be3760bc0ed6041f1bfcbb9cee883cb4b7c"
        ),
    ]
)
