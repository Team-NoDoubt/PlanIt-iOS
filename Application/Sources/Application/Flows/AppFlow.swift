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
}

class AppStepper: Stepper {
 
    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    var initialStep: Step {
        return AppStep.dashboardIsRequired
    }

    func readyToEmitSteps() {
    }
}
