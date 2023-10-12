import BaseModule
import Foundation

import Moya

enum AuthAPI {
    case refreshToken(refreshToken: String)
    case login(id: String, password: String)
}

extension AuthAPI: PlanItAPI {

    var erroerMapper: [Int : Error]? {
        return .none
    }

    var domain: String {
        return "/user"
    }

    var urlPath: String {
        switch self {
        case .refreshToken:
            return "/token"
        case .login:
            return "/auth"

        }
    }

    var method: Moya.Method {
        switch self {
        case .login:
            return .post
        case .refreshToken:
            return .put
        }
    }

    var task: Task {
        switch self {
        case .login(let id, let password):
            return .requestParameters(
                parameters: [
                    "account_id" : id,
                    "password": password
                ],
                encoding: JSONEncoding.default
            )
        default:
            return .requestPlain
        }
    }

    var headers: [String : String]? {
        switch self {
        case .refreshToken(let refreshToken):
            return ["Refresh-Token": "Bearer \(refreshToken)"]
        default:
            return ["":""]
        }
    }

}
