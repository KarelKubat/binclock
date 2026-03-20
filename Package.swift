// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "BinClock",
    platforms: [
        .macOS(.v14)
    ],
    products: [
        .executable(name: "BinClock", targets: ["BinClock"])
    ],
    targets: [
        .executableTarget(
            name: "BinClock",
            path: "Sources"
        )
    ]
)
