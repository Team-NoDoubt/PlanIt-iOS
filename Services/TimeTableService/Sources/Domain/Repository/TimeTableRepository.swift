import Foundation
import RxSwift

public protocol TimeTableRepository {
    func getTimeTable(grade: Int, classNum: Int) -> Single<[TimeTableEntity]>
    func getChangedList(grade: Int, classNum: Int) -> Single<[ChangedEntity]>
}
