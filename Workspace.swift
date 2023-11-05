import ProjectDescription

let workspace = Workspace(
    name: "PlanIt-Workspace",
    projects: [
               "ThirdPartyLib/",
                "Application",
                "DesignSystem",
                "Modules/**",
                "Services/**",
              ],
    fileHeaderTemplate: nil,
    additionalFiles: []
)
