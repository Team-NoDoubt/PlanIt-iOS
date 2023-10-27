import RxFlow
import UIKit

class LoginFlow: Flow {

    private let rootViewController = UINavigationController()

    var root: Presentable {
        return rootViewController
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        switch step {
        case .loginIsRequired:
            return navigateToLoginScreen()
        default:
            return .none
        }
    }

    private func navigateToLoginScreen() -> FlowContributors{
        return .one(flowContributor: .contribute(withNextPresentable: rootViewController, withNextStepper: OneStepper(withSingleStep: AppStep.loginIsRequired)))
    }
}
