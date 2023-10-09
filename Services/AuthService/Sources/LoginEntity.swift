import Foundation

public struct LoginEntity {
    let id: String
    let password: String

    public init(
        id: String,
        password: String
    ) {
        self.id = id
        self.password = password
    }
}
