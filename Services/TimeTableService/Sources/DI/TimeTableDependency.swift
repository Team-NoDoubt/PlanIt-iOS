import Foundation

public struct TimeTableDependency {
    
    public static let shared = Self.resolve()

    public let getTimeTableListUseCase: GetTimeTableListUseCase
}

extension TimeTableDependency {
    static func resolve() -> TimeTableDependency {
        let timeTableDataSource: TimeTableDataSourceImpl = TimeTableDataSourceImpl()

        let timeTableRepository: TimeTableRepository = TimeTableRepositoryImpl(
            timeTableDataSource: timeTableDataSource
        )
        let getTimeTableListUseCase = GetTimeTableListUseCase(
            repository: timeTableRepository
        )
        return .init(
            getTimeTableListUseCase: getTimeTableListUseCase
        )
    }
}
