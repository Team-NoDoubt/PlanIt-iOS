import Foundation
import RxFlow
import RxSwift
import RxRelay

class SeeMoreViewModel: ViewModelType, Stepper {

    var disposeBag = RxSwift.DisposeBag()

    var steps =  RxRelay.PublishRelay<RxFlow.Step>()
    

    struct Input {
        
    }
    struct Output {
        
    }

    func transform(_ input: Input) -> Output {
        return Output() 
    }
}
