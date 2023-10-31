import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "TimeTableService",
    platform: .iOS,
    dependencies: [
        .SPM.Moya,
        .Module.BaseModule
    ] + TargetDependency.universalDependencies
)
