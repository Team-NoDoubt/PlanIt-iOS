import Foundation
import AuthService
import TimeTableService

public struct StepperDI {
    public static let shared = resolve()

    public let loginViewModel: LoginViewModel
    public let timeTableviewModel: TimeTableViewModel
}

extension StepperDI {
    private static func resolve() -> StepperDI {

        let authServiceDependency = AuthServiceDependency.shared
        let timeTableServiceDependency = TimeTableDependency.shared

        let loginViewModel = LoginViewModel(
            loginUseCase: authServiceDependency.loginUseCase
        )
        let timeTableViewModel = TimeTableViewModel(
            timeTableListUseCase: timeTableServiceDependency.getTimeTableListUseCase
        )

        return .init(
            loginViewModel: loginViewModel,
            timeTableviewModel: timeTableViewModel
        )
    }
}
