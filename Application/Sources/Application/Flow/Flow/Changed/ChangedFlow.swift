import UIKit
import RxFlow
import RxSwift
import RxCocoa

class ChangedFlow: Flow {

    private let rootViewController = UINavigationController()

    var root: Presentable {
        return self.rootViewController
    }

    func adapt(step: Step) -> Single<Step> {
        switch step {
        default:
            return .just(step)
        }
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }

        switch step {
        case .changedSceneIsRequired:
            return navigateToChangedScreen()
        default:
            return .none
        }
    }

    private func navigateToChangedScreen() -> FlowContributors {
        let changedViewController = ChangedViewController()
        
        self.rootViewController.setViewControllers([changedViewController], animated: false)
    
//        self.rootViewController.pushViewController([changedViewController], animated: false)

    
        return .one(flowContributor: .contribute(
            withNextPresentable: changedViewController,
            withNextStepper: OneStepper(withSingleStep: AppStep.changedSceneIsRequired)))
    }
}
