import RxFlow
import UIKit

class TestFlow: Flow {

    private let rootViewController = UINavigationController()

    var root: RxFlow.Presentable {
        return rootViewController
    }
    
    func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? AppStep else { return  .none }
        switch step {
        case .testIsRequired:
            return navigateToTestScreen()
        default:
            return .none
        }
    }

    private func navigateToTestScreen() -> FlowContributors {
        let testVC = SettingViewController()
        self.rootViewController.pushViewController(testVC, animated: false)
        return .none
    }
    
}
