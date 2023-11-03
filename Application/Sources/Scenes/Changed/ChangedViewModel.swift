import Foundation
import TimeTableService
import RxSwift
import RxCocoa
import RxFlow

public class ChangedViewModel: ViewModelType, Stepper {
    public var steps = PublishRelay<Step>()
    var disposeBag = DisposeBag()
    private let getChangedListUseCase: GetChangedListUseCase

    init(steps: PublishRelay<Step> = PublishRelay<Step>(), getChangedListUseCase: GetChangedListUseCase) {
        self.steps = steps
        self.getChangedListUseCase = getChangedListUseCase
    }

    struct Input {
        let getChangedListData: Signal<Void>
    }
    struct Output {
        let changedList: PublishRelay<[ChangedEntity]>
    }

    func transform(_ input: Input) -> Output {
        let changedData = PublishRelay<[ChangedEntity]>()
        input.getChangedListData.asObservable().flatMap {
            self.getChangedListUseCase.excute(grade: 2, classNum: 1)
        }.subscribe(onNext: {
            changedData.accept($0)
            print($0)
        }).disposed(by: disposeBag)

        return Output(changedList: changedData)
    }
}
