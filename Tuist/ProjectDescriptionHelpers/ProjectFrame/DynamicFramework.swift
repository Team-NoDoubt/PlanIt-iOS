import ProjectDescription

extension Project {
    public static func DynamicFramework(
        name: String,
        platform: Platform,
        infoPlist: InfoPlist = .default,
        dependencies: [TargetDependency]
    ) -> Project {
        return Project(
            name: name,
            targets: [
                Target(
                    name: name,
                    platform: platform,
                    product: .framework,
                    bundleId: "\(NodoubtOrganizationName).\(name)",
                    deploymentTarget: .iOS(
                        targetVersion: "15.0",
                        devices: [.iphone, .ipad]
                    ),
                    infoPlist: infoPlist,
                    sources: ["Sources/**"],
                    dependencies: dependencies
                )
                
            ]
        )
    }
}
