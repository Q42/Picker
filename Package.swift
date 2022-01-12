// swift-tools-version:5.0
import PackageDescription

let package = Package(
  name: "Picker",
  platforms: [
    .macOS(.v10_12), .iOS(.v10), .tvOS(.v9), .watchOS(.v3)
  ],
  products: [
    .library(name: "Picker", targets: ["Picker"]),
  ],
  dependencies: [
    .package(url: "https://github.com/tomlokhorst/Promissum", from: "7.0.0")
  ],
  targets: [
    .target(name: "Picker", dependencies: ["Promissum"]),
  ]
)

