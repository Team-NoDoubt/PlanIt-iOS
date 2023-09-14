import ProjectDescription

let dependencies = Dependencies(
    swiftPackageManager: SwiftPackageManagerDependencies([
        //Moya
        .remote(url: "https://github.com/Moya/Moya.git",
                requirement: .upToNextMajor(from: "15.0.0")),
        //RxSwift
        .remote(url: "https://github.com/ReactiveX/RxSwift",
                requirement: .upToNextMajor(from: "6.5.0")),
        //Then
        .remote(url: "https://github.com/devxoul/Then.git",
                requirement: .upToNextMajor(from: "2.7.0")),
        //SnapKit
        .remote(url: "https://github.com/SnapKit/SnapKit.git",
                requirement: .upToNextMajor(from: "5.0.1")),
        //Kingfisher
        .remote(url: "https://github.com/onevcat/Kingfisher",
                requirement: .upToNextMajor(from: "7.2.4")),
        //RxFlow
        .remote(url: "https://github.com/RxSwiftCommunity/RxFlow.git",
                requirement: .upToNextMajor(from: "2.10.0"))
    ]),
    platforms: [.iOS]
)
