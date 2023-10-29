import Foundation
import RxFlow
import RxSwift
import RxCocoa
import AuthService

public class LoginViewModel: ViewModelType, Stepper {

    public var steps = PublishRelay<Step>()
    var disposeBag: DisposeBag = DisposeBag()
    private let loginUseCase: LoginUseCase
    var output = Output()

    init(loginUseCase: LoginUseCase) {
        self.loginUseCase = loginUseCase
    }
    
    struct Input {
        let idText: Driver<String>
        let passwordText: Driver<String>
        let loginButtonTap: Driver<Void>
    }
    
    struct Output {
    }
    func transform(_ input: Input) -> Output {
        let info = Driver.combineLatest(input.idText, input.passwordText)
        input.loginButtonTap
            .asObservable()
            .withLatestFrom(info)
            .flatMap { id, password in
                self.loginUseCase.excute(id: id, password: password)
                    .andThen(Single.just(AppStep.tabIsRequired))
            }
            .bind(to: steps)
            .disposed(by: disposeBag)


        return output
    }
}
