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
            url: "https://github.com/getfedo/fedo-ios/releases/download/0.5.0/FedoKit.xcframework.zip",
            checksum: "ef236438b500bf1a1e14aeda31da43e26fc0966a2a345dc5ee80bb4e9cff6b4d"
        ),
    ]
)
