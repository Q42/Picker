// swift-tools-version:4.0
import PackageDescription

let package = Package(
  name: "Picker",
  dependencies: [
    .package(url: "https://github.com/tomlokhorst/Promissum", from: "2.0.0")
  ],
  targets: [
    .target(
      name: "Picker",
      dependencies: ["Promissum"]
    )
  ],
  swiftLanguageVersions: [4]
)
