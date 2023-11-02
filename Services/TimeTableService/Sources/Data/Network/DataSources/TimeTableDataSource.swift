import Moya
import Foundation
import RxMoya
import RxSwift

protocol TimeTableDataSource {
    func getTimeTable(grade: Int, classNum: Int) -> Single<[TimeTableEntity]>
}
