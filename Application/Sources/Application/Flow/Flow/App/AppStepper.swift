import RxFlow
import RxCocoa
import RxSwift

class AppStepper: Stepper {
 
    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()
    public init() { }

//    var initialStep: Step {
//        return steps.accept(AppStep.loginIsRequired) as! Step
//    }

    public func readyToEmitSteps() {
        steps.accept(AppStep.tabIsRequired)
    }
}
