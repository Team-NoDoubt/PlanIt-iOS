import Foundation

public protocol KeychainType {
    func save(tokenType: TokenType, value: String)
    func delete(tokenType: TokenType, value: String)
    func fetch(tokenType: TokenType) -> String
}
