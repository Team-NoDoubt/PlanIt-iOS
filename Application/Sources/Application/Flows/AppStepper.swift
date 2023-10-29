import RxFlow
import RxCocoa
import RxSwift

class AppStepper: Stepper {
 
    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()
    public init() { }

//    var initialStep: Step {
////        return AppStep.loginIsRequired
//    }

    public func readyToEmitSteps() {
        steps.accept(AppStep.tabIsRequired)
    }
}
