import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeDesignSystem(
    name: "PlanItDS",
    platform: .iOS,
    dependencies: [
        .ThirdPartyLib.thirdParty
    ]
)
