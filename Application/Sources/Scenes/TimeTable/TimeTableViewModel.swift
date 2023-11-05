import Foundation
import TimeTableService
import RxSwift
import RxCocoa
import RxFlow

public class TimeTableViewModel: ViewModelType, Stepper {

    public var steps = PublishRelay<Step>()
    var disposeBag: RxSwift.DisposeBag = DisposeBag()
    private let timeTableListUseCase: GetTimeTableListUseCase

    init(timeTableListUseCase: GetTimeTableListUseCase) {
        self.timeTableListUseCase = timeTableListUseCase
    }

    struct Input {
        let getTimeTableData: Signal<Void>
    }
    struct Output {
        let timTableList: PublishRelay<[TimeTableEntity]>
    }
    func transform(_ input: Input) -> Output {
        let timeTableData = PublishRelay<[TimeTableEntity]>()
        input.getTimeTableData.asObservable().flatMap {
            self.timeTableListUseCase.excute(grade: 2, classNum: 1)
        }.subscribe(onNext: {
            timeTableData.accept($0)
            print($0)
        }).disposed(by: disposeBag)
        
        return Output(timTableList: timeTableData)
    }
}
