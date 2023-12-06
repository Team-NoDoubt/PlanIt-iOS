import Foundation
import Moya
import RxSwift

class TimeTableRepositoryImpl: TimeTableRepository {
    
    private let timeTableDataSource: TimeTableDataSource
    
    init(timeTableDataSource: TimeTableDataSource) {
        self.timeTableDataSource = timeTableDataSource
    }
    
    func getTimeTable(grade: Int, classNum: Int) -> RxSwift.Single<[TimeTableEntity]> {
        timeTableDataSource.getTimeTable(grade: grade, classNum: classNum)
            .map { timeTables in
                //금요일 시간표 6,7교시 빈 배열 추가
                var fillTimeTables = timeTables
                if let lastTimeTable = timeTables.last, lastTimeTable.weekOfDate == 5 && lastTimeTable.period == 5 {
                    let emptyTimeTable1 = TimeTableEntity(grade: lastTimeTable.grade, classNum: lastTimeTable.classNum, period: 6, weekOfDate: 5, subject: Subject(rawValue: "") ?? .NONE)
                    let emptyTimeTable2 = TimeTableEntity(grade: lastTimeTable.grade, classNum: lastTimeTable.classNum, period: 7, weekOfDate: 5, subject: Subject(rawValue: "") ?? .NONE)
                    fillTimeTables.append(contentsOf: [emptyTimeTable1, emptyTimeTable2])
                }
                return fillTimeTables.sorted(by: { $0.period < $1.period })
            }
    }
    func getChangedList(grade: Int, classNum: Int) -> RxSwift.Single<[ChangedEntity]> {
        timeTableDataSource.getChangedList(grade: grade, classNum: classNum)
    }
}

