import UIKit
import RxFlow
import RxSwift
import RxCocoa

class ETCFlow: Flow {

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
        default:
            return .none
        }
    }
}

