import Foundation
import Moya

public protocol PlanItAPI: TargetType {
    var domain: String { get }
    var urlPath: String { get }
    var erroerMapper: [Int: Error]? { get }
}

public extension PlanItAPI {

    var baseURL: URL {
       return URL(string: "http://3.36.166.250:8080")!
    }

    var path: String {
        return domain + urlPath
    }

    var task: Task {
        return .requestPlain
    }

    var validationType: ValidationType {
        return .successCodes
    }

    var headers: [String: String]? {
        return nil
    }
}
