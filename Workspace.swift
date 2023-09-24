import ProjectDescription

let workspace = Workspace(
    name: "PlanIt-Workspace",
    projects: [
                "Application",
                "DesignSystem",
                "Modules/**",
                "Services/**"
              ],
    fileHeaderTemplate: nil,
    additionalFiles: []
)
