import RxFlow

enum AppStep: Step {
    //Global
    case onboardingIsRequired
    case dashboardIsRequired

    //Auth
    case loginIsRequired

    //Timetable
    case timeTableIsRequired

    //Changed
    case changedSceneIsRequired

    //ETC
    case etcListAreRequired

}
