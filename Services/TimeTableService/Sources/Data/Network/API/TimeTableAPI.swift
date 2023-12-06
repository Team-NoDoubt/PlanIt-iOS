import Moya
import BaseModule

enum TimeTableAPI {
    case getTimeTable(grade: Int, classNum: Int)
    case getChangedTimeTable(grade: Int, classNum: Int)
}

extension TimeTableAPI: PlanItAPI {

    var erroerMapper: [Int : Error]? {
        [
            400: TimeTableServiceError.badRequest,
            401: TimeTableServiceError.unauthorized,
            403: TimeTableServiceError.forbidden,
            404: TimeTableServiceError.notFound,
            409: TimeTableServiceError.conflict,
            429: TimeTableServiceError.tooManyRequests,
            500: TimeTableServiceError.internalServerError
        ]
    }
    var domain: String {
        return "/timetables"
    }
    
    var urlPath: String {
        switch self {
        case .getChangedTimeTable:
            return "/date/changed"
        case .getTimeTable:
            return "/date"
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    var task: Task {
        switch self {
        case .getTimeTable(let grade, let classNum), .getChangedTimeTable(let grade, let classNum):
            return .requestParameters(
                parameters: [
                    "grade": grade,
                    "class": classNum
                ],
                encoding: URLEncoding.default)
        }
    }
}
