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
        case .tabIsRequired:
            return self.navigationToTabScreen()
        case .loginIsRequired:
            return self.navigateToLoginScreen()
        default:
            return .none
        }
    }
    
    private func navigationToTabScreen() -> FlowContributors {
        let dashboardFlow = DashboardFlow()
        
        Flows.use(dashboardFlow, when: .created) { [unowned self] root in
//            self.rootViewController.pushViewController(root, animated: false)
////            self?.rootViewController.present(root, animated: true)
            if let rootViewController = (root as? UINavigationController)?.viewControllers.first {
                self.rootViewController.pushViewController(rootViewController, animated: false)
            }
            
        }
        return .one(flowContributor: .contribute(
                withNextPresentable: dashboardFlow,
                withNextStepper: OneStepper(withSingleStep: AppStep.tabIsRequired)
        ))
    }

    private func navigateToLoginScreen() -> FlowContributors {
        let loginFlow = LoginFlow()
        Flows.use(loginFlow, when: .created) { [unowned self] root in
//            self.rootViewController.pushViewController(root, animated: false)
            if let rootViewController = (root as? UINavigationController)?.viewControllers.first {
                self.rootViewController.pushViewController(rootViewController, animated: false)
            }

        }
        return .one(flowContributor: .contribute(
            withNextPresentable: loginFlow,
            withNextStepper: OneStepper(withSingleStep: AppStep.loginIsRequired)))
    }
}
