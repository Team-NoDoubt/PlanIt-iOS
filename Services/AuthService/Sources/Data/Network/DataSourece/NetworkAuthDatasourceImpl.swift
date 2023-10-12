import Foundation
import RxSwift
import RxMoya
import Moya

class NetworkAuthDatasourceImpl: NetworkAuthDataSource {

    private let provider = MoyaProvider<AuthAPI>()

    func login(id: String, password: String) -> Single<TokenDTO> {
        return provider.rx.request(.login(id: id, password: password))
            .filterSuccessfulStatusCodes()
            .map(TokenDTO.self)
    }

}

