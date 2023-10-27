import UIKit
import AuthService
import Then
import PlanItDS
import SnapKit
import RxSwift
import RxFlow

class LoginViewController: UIViewController {

    var viewModel: LoginViewModel!

    init(loginUseCase: LoginUseCase) {
        self.viewModel = LoginViewModel(loginUseCase: loginUseCase)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        view.backgroundColor = .blue
        addView()
        setLayout()
        bind()
    }

    private let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "small_PLANIT")
    }
    private let loginLabel = UILabel().then {
        $0.text = "로그인"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    }
    private let idTextField = PlanItTextField().then {
        $0.placeholder = "아이디"
    }
    private let passwordTextField = PlanItTextField().then {
        $0.placeholder = "비밀번호"
    }
    private let loginButton = FillButton(type: .system).then {
        $0.setTitle("로그인", for: .normal)
    }

    private func bind() {
        
        let input = LoginViewModel.Input(
            idText: idTextField.rx.text.orEmpty.asDriver(),
            passwordText: passwordTextField.rx.text.orEmpty.asDriver(),
            loginButtonTap: loginButton.rx.tap.asDriver()
        )
        _ = viewModel.transform(input)
    }
}

// MARK: - Setup Views
extension LoginViewController {

    private func addView() {
        [
            logoImageView,
            loginLabel,
            idTextField,
            passwordTextField,
            loginButton
        ].forEach { view.addSubview($0)}
    }
    private func setLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(160)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(25)
        }
        loginLabel.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.height.equalTo(24)
        }
        idTextField.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(49)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(idTextField.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(49)
        }
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(45)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(50)
        }
    }
    
}
