import Moya
import RxSwift
import RxMoya
import Foundation

class TimeTableDataSourceImpl: TimeTableDataSource {

    private let provider = MoyaProvider<TimeTableAPI>()

    func getTimeTable(grade: Int, classNum: Int) -> Single<[TimeTableEntity]> {
        return provider.rx.request(.getTimeTable(grade: grade, classNum: classNum))
            .map ( TimeTableListResponse.self)
            .map { $0.toDomain() }
    }
    func getChangedList(grade: Int, classNum: Int) -> Single<[ChangedEntity]> {
        return provider.rx.request(.getChangedTimeTable(grade: grade, classNum: classNum))
            .map( ChangedListResponse.self )
            .map { $0.toDomain() }
    }
}
