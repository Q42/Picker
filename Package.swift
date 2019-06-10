// swift-tools-version:5.0
import PackageDescription

let package = Package(
  name: "Picker",
  products: [
    .library(name: "Picker", targets: ["Picker"]),
  ],
  dependencies: [
    .package(url: "https://github.com/tomlokhorst/Promissum", from: "4.0.0")
  ],
  targets: [
    .target(name: "Picker", dependencies: ["Promissum"]),
  ]
)

