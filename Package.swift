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
            checksum: "c2d14651582dda732863deed44c39ce38516dad3a04524d1adc57e79270bcc40"
        ),
    ]
)
