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
            url: "https://github.com/getfedo/fedo-ios/releases/download/0.4.0-beta.3/FedoKit.xcframework.zip",
            checksum: "330e97b9ffbab2743800cd3afc51a5d3b3be55d162040d927b508f3dae4254ac"
        ),
    ]
)
