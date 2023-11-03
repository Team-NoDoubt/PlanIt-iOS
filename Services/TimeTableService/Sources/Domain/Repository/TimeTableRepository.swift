import Foundation
import RxSwift

public protocol TimeTableRepository {
    func getTimeTable(grade: Int, classNum: Int) -> Observable<[TimeTableEntity]>
    func getChangedList(grade: Int, classNum: Int) -> Observable<[ChangedEntity]>
}
