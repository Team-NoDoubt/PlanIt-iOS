import Foundation
import AuthService

public struct StepperDI {
    public static let shared = resolve()

    public let loginViewModel: LoginViewModel
}

extension StepperDI {
    private static func resolve() -> StepperDI {

        let authServiceDependency = AuthServiceDependency.shared

        let loginViewModel = LoginViewModel(
            loginUseCase: authServiceDependency.loginUseCase
        )

        return .init(
            loginViewModel: loginViewModel
        )
    }
}
