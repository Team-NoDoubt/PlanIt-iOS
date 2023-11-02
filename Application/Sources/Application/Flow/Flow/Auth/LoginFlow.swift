import RxFlow
import UIKit

class LoginFlow: Flow {

    public init() {}

    private lazy var rootViewController = UINavigationController()

    var root: Presentable {
        return rootViewController
    }

    private let container = StepperDI.shared

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
        let viewModel = container.loginViewModel
        let loginViewController = LoginViewController(viewModel: viewModel)
        rootViewController.pushViewController(loginViewController, animated: false)
        return .one(flowContributor: .contribute(
            withNextPresentable: loginViewController,
            withNextStepper: viewModel))
    }
}
