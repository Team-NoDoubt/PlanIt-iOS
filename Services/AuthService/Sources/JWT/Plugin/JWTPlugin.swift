import Foundation
import Moya

public protocol JWTTokenAuthorizable {
    var jwtTokenType: JWTTokenType { get }
}

public struct JWTPlugin: PluginType {
    private let keychain: KeychainImpl

    public init(keychain: KeychainImpl) {
        self.keychain = keychain
    }

    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {

        guard let authorizable = target as? JWTTokenAuthorizable,
              let token = getToken(type: authorizable.jwtTokenType),
              authorizable.jwtTokenType != .none
        else { return request }

        var request = request

        let authValue = "Bearer \(token)"
        request.addValue(authValue, forHTTPHeaderField: authorizable.jwtTokenType.rawValue)
        return request
    }
}

extension JWTPlugin {
    
    private func getToken(type: JWTTokenType) -> String? {
        switch type {
        case .none:
            return nil
        case .accessToken:
            return "Bearer \(keychain.fetch(tokenType: .accessToken))"
        case .refreshToken:
            return keychain.fetch(tokenType: .refreshToken)
        }
    }
}
