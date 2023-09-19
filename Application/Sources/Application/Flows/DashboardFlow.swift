import Foundation
import RxFlow
import UIKit

class DashboardFlow: Flow {

    private let rootViewController = UITabBarController()

    var root: Presentable {
        return rootViewController
    }

    func navigate(to step: RxFlow.Step) -> RxFlow.FlowContributors {
        guard let step = step as? AppStep else { return .none }

        switch step {
        case .dashboardIsRequired:
            return navigateToDashboard()
        default:
            return .none
        }
    }

    private func navigateToDashboard() -> FlowContributors {

        let timeTableFlow = TimeTableFlow()
        let changedFlow = ChangedFlow()
        let etcFlow = ETCFlow()

        Flows.use(
            timeTableFlow,
            changedFlow,
            etcFlow,
            when: .created
        ) { [unowned self] root1, root2, root3 in
            let tabBarItem1 = UITabBarItem(
                title: "Wishlist",
                image: UIImage(named: "wishlist"),
                selectedImage: nil
            )
            let tabBarItem2 = UITabBarItem(
                title: "Watched",
                image: UIImage(named: "watched"),
                selectedImage: nil
            )
            let tabBarItem3 = UITabBarItem(
                title: "Trending",
                image: UIImage(named: "trending"),
                selectedImage: nil
            )
            root1.tabBarItem = tabBarItem1
            root1.title = "Wishlist"
            root2.tabBarItem = tabBarItem2
            root2.title = "Watched"
            root3.tabBarItem = tabBarItem3
            root3.title = "Trending"

            self.rootViewController.setViewControllers([root1, root2, root3], animated: false)
//            self?.rootViewController.selectedIndex = 1
        }

        return .multiple(flowContributors: [
            .contribute(
                withNextPresentable: timeTableFlow,
                withNextStepper: OneStepper(withSingleStep: AppStep.timeTableIsRequired)),
            .contribute(
                withNextPresentable: changedFlow,
                withNextStepper: OneStepper(withSingleStep: AppStep.changedSceneIsRequired)),
            .contribute(
                withNextPresentable: etcFlow,
                withNextStepper: OneStepper(withSingleStep: AppStep.etcListAreRequired)
            )
        
        ])
    }
    
}
