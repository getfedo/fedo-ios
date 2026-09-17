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
            url: "https://github.com/getfedo/fedo-ios/releases/download/0.4.0-beta.1/FedoKit.xcframework.zip",
            checksum: "1c1c8bf9a98a490bbb1924b831ef7afe4a083a2ab900535fd28f4e5b001b6f40"
        ),
    ]
)
