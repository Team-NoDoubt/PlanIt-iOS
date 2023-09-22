import UIKit
import RxFlow
import RxCocoa
import RxSwift

class AppFlow: Flow {

    var root: Presentable {
        return self.rootViewController
    }
    
    private lazy var rootViewController: UINavigationController = {
        let viewController = UINavigationController()
        viewController.setNavigationBarHidden(true, animated: false)
        return viewController
    }()
    
    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        
        switch step {
        case .dashboardIsRequired:
            return self.navigationToDashboardScreen()
        case .loginIsRequired:
            return self.navigateToLoginScreen()
        default:
            return .none
        }
    }
    
    private func navigationToDashboardScreen() -> FlowContributors {
        let dashboardFlow = DashboardFlow()
        
        Flows.use(dashboardFlow, when: .created) { [unowned self] root in
            self.rootViewController.pushViewController(root, animated: false)
//            self?.rootViewController.present(root, animated: true)
            
        }
        return .one(flowContributor: .contribute(
                                                    withNextPresentable: dashboardFlow,
                                                    withNextStepper: OneStepper(withSingleStep: AppStep.dashboardIsRequired)
        ))
    }

    private func navigateToLoginScreen() -> FlowContributors {
        let loginFlow = LoginFlow()
        Flows.use(loginFlow, when: .created) { [unowned self] root in
            
            self.rootViewController.pushViewController(root, animated: false)
        }
        return .one(flowContributor: .contribute(withNextPresentable: loginFlow, withNextStepper: OneStepper(withSingleStep: AppStep.loginIsRequired)))
    }
}
