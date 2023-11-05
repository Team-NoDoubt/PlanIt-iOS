import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "BaseModule",
    platform: .iOS,
    dependencies: [
        .ThirdPartyLib.thirdParty
    ]
)
