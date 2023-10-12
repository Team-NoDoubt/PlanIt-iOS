import Foundation
import Security

public class KeychainImpl: KeychainType {

    private let bundleIdentifier: String = Bundle.main.bundleIdentifier ?? ""

    public func save(tokenType: TokenType, value: String) {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: tokenType.rawValue,
            kSecAttrService: bundleIdentifier,
            kSecValueData: value.data(using: .utf8, allowLossyConversion: false) as Any
        ]
        SecItemDelete(query)
        SecItemAdd(query, nil)
    }

    public func delete(tokenType: TokenType, value: String) {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: tokenType.rawValue,
            kSecAttrService: bundleIdentifier,
            kSecReturnData: kCFBooleanTrue!,
            kSecValueData: value.data(using: .utf8, allowLossyConversion: false) as Any
        ]
        SecItemDelete(query)
    }

    public func fetch(tokenType: TokenType) -> String {
        let query: NSDictionary = [
            kSecClass: kSecClassGenericPassword,
            kSecAttrAccount: tokenType.rawValue,
            kSecAttrService: bundleIdentifier,
        ]
        var dataTypeRef: AnyObject?
        let status = SecItemCopyMatching(query, &dataTypeRef)
        if status == errSecSuccess {
            guard let data = dataTypeRef as? Data else { return "" }
            return String(data: data, encoding: .utf8) ?? ""
        }
        return ""
    }
}
