import UIKit
import RxFlow
import RxCocoa
import RxSwift

class AppFlow: Flow {

    private var window: UIWindow

    var root: Presentable {
        return self.window
    }

    public init(window: UIWindow) {
        self.window = window
    }

    func navigate(to step: Step) -> FlowContributors {
        guard let step = step as? AppStep else { return .none }
        
        switch step {
        case .tabIsRequired:
            return self.navigationToTabScreen()
        case .loginIsRequired:
            return self.navigateToLoginScreen()
        case .testIsRequired:
            return self.navigateTestScreen()
        default:
            return .none
        }
    }
    
    private func navigationToTabScreen() -> FlowContributors {
        let tabsFlow = TabsFlow()
        
        Flows.use(tabsFlow, when: .created) { [weak self] root in
            self?.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(
                withNextPresentable: tabsFlow,
                withNextStepper: OneStepper(withSingleStep: AppStep.tabIsRequired)
        ))
    }

    private func navigateToLoginScreen() -> FlowContributors {
        let loginFlow = LoginFlow()
        Flows.use(loginFlow, when: .created) { [weak self] root in
            self?.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(
            withNextPresentable: loginFlow,
            withNextStepper: OneStepper(withSingleStep: AppStep.loginIsRequired)))
    }

    private func navigateTestScreen() -> FlowContributors {
        let testFlow = TestFlow()
        Flows.use(testFlow, when: .created) { [weak self] root in
            self?.window.rootViewController = root
        }
        return .one(flowContributor: .contribute(
            withNextPresentable: testFlow,
            withNextStepper: OneStepper(withSingleStep: AppStep.testIsRequired)))
    }
}
