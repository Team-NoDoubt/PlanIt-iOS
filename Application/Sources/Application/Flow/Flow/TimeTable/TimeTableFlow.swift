import UIKit
import RxFlow
import RxSwift
import RxCocoa
import TimeTableService

class TimeTableFlow: Flow {

    private let rootViewController = UINavigationController()

    var root: Presentable {
        return self.rootViewController
    }

    private let container = StepperDI.shared

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
 
        let timeTableViewController = TimeTableViewController(viewModel: container.timeTableviewModel)
        self.rootViewController.setViewControllers([timeTableViewController], animated: false)

//        self.rootViewController.pushViewController([timeTableViewController], animated: false)

        return .one(flowContributor: .contribute(
            withNextPresentable: timeTableViewController,
            withNextStepper: OneStepper(withSingleStep: AppStep.timeTableIsRequired)))
    }

}
