import Foundation
import RxSwift

public protocol AuthRepository {
    func login(id: String, password: String) -> Completable
}
