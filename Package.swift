// swift-tools-version:5.0
import PackageDescription


let package = Package(
	name: "FRZSwizzling",
	products: [
		.library(name: "FRZSwizzling", targets: ["FRZSwizzling"])
	],
	targets: [
		.target(name: "FRZSwizzling", path: "Sources"),
		.testTarget(name: "FRZSwizzlingTests", dependencies: ["FRZSwizzling"], path: "Tests", exclude: ["FRZSwizzlingTests.swift"])
	]
)
