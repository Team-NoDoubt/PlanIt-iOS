import Foundation
import RxSwift

public protocol NetworkAuthDataSource {
    func login(id: String, password: String) -> Single<TokenDTO>
}
