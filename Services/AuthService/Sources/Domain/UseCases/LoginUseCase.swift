import Foundation
import RxSwift

public class LoginUseCase {

    let repository: AuthRepositoryImpl

    init(repository: AuthRepositoryImpl) {
        self.repository = repository
    }

    public func excute(id: String, password: String) -> Completable {
        return repository.login(id: id, password: password)
    }
}
