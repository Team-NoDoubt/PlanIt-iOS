import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "TimeTableService",
    platform: .iOS,
    dependencies: [
        .ThirdPartyLib.thirdParty,
        .Module.BaseModule
    ]
)
