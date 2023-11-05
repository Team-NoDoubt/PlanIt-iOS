import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "AuthService",
    platform: .iOS,
    dependencies: [
        .ThirdPartyLib.thirdParty,
        .Module.BaseModule
    ]
)
