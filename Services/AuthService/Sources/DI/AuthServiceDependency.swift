import Foundation

public struct AuthServiceDependency {

    public static let shared = Self.resolve()

    public let loginUseCase: LoginUseCase
}

extension AuthServiceDependency {
    static func resolve() -> AuthServiceDependency {
        let networkAuthDataSource: NetworkAuthDatasourceImpl = NetworkAuthDatasourceImpl()
        let keychainDataSourceImpl: KeychainImpl = KeychainImpl()

        let authRepository: AuthRepository = AuthRepositoryImpl(
            networkAuthDataSource: networkAuthDataSource,
            keychainDataSource: keychainDataSourceImpl
        )

        let loginUseCase = LoginUseCase(
            repository: authRepository as! AuthRepositoryImpl
        )

        return AuthServiceDependency(
            loginUseCase: loginUseCase
        )
    }
}
