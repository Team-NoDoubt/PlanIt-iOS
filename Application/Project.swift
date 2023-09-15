import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "PlanIt-iOS",
    targets: [
        Target(
            name: "PlanIt-iOS",
            platform: .iOS,
            product: .app,
            bundleId: "com.noubt",
            deploymentTarget: .iOS(
                targetVersion: "15.0",
                devices: .iphone
            ),
            infoPlist: .file(path: "SupportingFiles/Info.plist"),
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            dependencies: [
                .Module.BaseModule,
                .project(target: "PlanItDS", path: "../PlanItDS")
            ] + TargetDependency.appDependencies
        )]
)


