import Foundation

public enum JWTTokenType: String {
    case accessToken = "Authorization"
    case refreshToken = "refresh-token"
    case none
}

public protocol JwtAuthorizable {
    var jwtTokenType: JWTTokenType { get }
}
