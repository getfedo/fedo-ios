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
            url: "https://github.com/getfedo/fedo-ios/releases/download/0.4.0-beta.2/FedoKit.xcframework.zip",
            checksum: "98aa466024b81faac1ef1f7171c5c58e769c83c1482a33b0f048b60907194ebc"
        ),
    ]
)
