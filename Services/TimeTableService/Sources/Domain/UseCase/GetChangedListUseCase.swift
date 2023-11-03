import Foundation
import RxSwift

public class GetChangedListUseCase {

    private let repository: TimeTableRepository

    init(repository: TimeTableRepository) {
        self.repository = repository
    }

    public func excute(grade: Int, classNum: Int) -> Observable<[ChangedEntity]> {
        return repository.getChangedList(grade: grade, classNum: classNum)
    }
}
