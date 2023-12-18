import RxFlow

public enum AppStep: Step {
    //Global
    case onboardingIsRequired
    case tabIsRequired

    //Auth
    case loginIsRequired

    //Timetable
    case timeTableIsRequired

    //Changed
    case changedSceneIsRequired

    //SeeMore
    case seeMoreScreenIsRequired
    case bugReportIsRequired

    case testIsRequired

}
