// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "swiftbot",
    dependencies: [
        .Package(url: "https://github.com/SlackKit/SlackKit.git", majorVersion: 4),
        ]
)
