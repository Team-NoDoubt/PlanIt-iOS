import Foundation
import Moya

protocol PlanItAPI: TargetType {
    var domain: String { get }
    var urlPath: String { get }
    var erroerMapper: [Int: Error]? { get }
}

extension PlanItAPI {

    var baseURL: URL { URL(string: "http://43.201.53.240:8000")! }

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
