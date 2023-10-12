import Foundation
import RxSwift
import Moya

class AuthRepositoryImpl: AuthRepository {
    
    private let networkAuthDataSource: NetworkAuthDatasourceImpl
    private let keychainDataSource: KeychainImpl
    private var disposeBag = DisposeBag()
    
    init(
        networkAuthDataSource: NetworkAuthDatasourceImpl,
        keychainDataSource: KeychainImpl
    ) {
        self.networkAuthDataSource = networkAuthDataSource
        self.keychainDataSource = keychainDataSource
    }
    
    func login(id: String, password: String) -> RxSwift.Completable {
        networkAuthDataSource.login(id: id, password: password)
            .do(onSuccess: { [weak self] token in
                self?.keychainDataSource.save(tokenType: TokenType(rawValue: token.accessToken)!, value: token.accessToken)
                self?.keychainDataSource.save(tokenType: TokenType(rawValue: token.refreshToken)!, value: token.refreshToken)
            }).catch { error -> Single in
                if let moyaError = error as? MoyaError {
                    switch moyaError {
                    case .statusCode(let response):
                        print("Status code: ", response.statusCode)
                    default:
                        print(moyaError.localizedDescription)
                    }
                }
                return Single.error(error)
            }.asCompletable()
    }
    
}
