import UIKit
import RxFlow
import RxSwift
import RxCocoa

class SeeMoreFlow: Flow {

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
        case .seeMoreScreenIsRequired:
            return navigateToSeeMoreScreen()
        default:
            return .none
        }
    }

    private func navigateToSeeMoreScreen() -> FlowContributors {
        let etcViewController = SeeMoreViewController()
        self.rootViewController.setViewControllers([etcViewController], animated: false)

        return .one(flowContributor: .contribute(withNextPresentable: etcViewController, withNextStepper: OneStepper(withSingleStep: AppStep.seeMoreScreenIsRequired)))
    }
}

