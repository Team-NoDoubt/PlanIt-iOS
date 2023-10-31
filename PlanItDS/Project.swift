import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.dynamicFramework(
    name: "PlanItDS",
    platform: .iOS,
    dependencies: [] + TargetDependency.universalDependencies + TargetDependency.appDependencies
)
