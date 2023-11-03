import Foundation
import Moya
import RxSwift

class TimeTableRepositoryImpl: TimeTableRepository {

    private let timeTableDataSource: TimeTableDataSource

    init(timeTableDataSource: TimeTableDataSource) {
        self.timeTableDataSource = timeTableDataSource
    }

    func getTimeTable(grade: Int, classNum: Int) -> RxSwift.Observable<[TimeTableEntity]> {
        timeTableDataSource.getTimeTable(grade: grade, classNum: classNum)
            .asObservable()
    }
    func getChangedList(grade: Int, classNum: Int) -> RxSwift.Observable<[ChangedEntity]> {
        timeTableDataSource.getChangedList(grade: grade, classNum: classNum)
            .asObservable()
    }
}
