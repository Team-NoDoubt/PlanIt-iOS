import RxFlow
import RxCocoa
import RxSwift

class AppStepper: Stepper {
 
    let steps = PublishRelay<Step>()
    private let disposeBag = DisposeBag()

    var initialStep: Step {
        return AppStep.loginIsRequired
    }

    func readyToEmitSteps() {
    }
}
