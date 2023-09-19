import UIKit
import RxFlow
import RxSwift
import RxCocoa

class TimeTableFlow: Flow {

    private let rootViewController = UINavigationController()

    var root: Presentable {
        return self.rootViewController
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }

        switch step {
        case .timeTableIsRequired:
            return navigateToTimeTableScreen()
        default:
            return .none
        }
    }

    private func navigateToTimeTableScreen() -> FlowContributors {
        let timeTableViewController = TimeTableViewController()
        self.rootViewController.setViewControllers([timeTableViewController], animated: false)

        return .one(flowContributor: .contribute(
            withNextPresentable: timeTableViewController,
            withNextStepper: OneStepper(withSingleStep: AppStep.timeTableIsRequired)))
    }

}
