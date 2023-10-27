import Foundation

public struct TokenDTO: Decodable {
    let accessToken: String
    let refreshToken: String
    let accessTokenExpiredAt: Date

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case refreshToken = "refresh_token"
        case accessTokenExpiredAt = "access_token_exp"
    }
}
