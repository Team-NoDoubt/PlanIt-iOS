import Foundation
import RxSwift

public class GetTimeTableListUseCase {

    private let repository: TimeTableRepository

    init(repository: TimeTableRepository) {
        self.repository = repository
    }

    public func excute(grade: Int, classNum: Int) -> Single<[TimeTableEntity]> {
        return repository.getTimeTable(grade: grade, classNum: classNum)
    }
}
