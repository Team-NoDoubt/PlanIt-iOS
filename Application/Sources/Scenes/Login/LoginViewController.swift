import UIKit
import Then
import PlanItDS
import SnapKit

class LoginViewController: UIViewController {
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        addView()
        setLayout()
    }

    private let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "small_PLANIT")
    }
    private let loginLabel = UILabel().then {
        $0.text = "로그인"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
    }

    private let loginTextField = PlanItTextField().then {
        $0.placeholder = "아이디"
    }
    private let passwordTextField = PlanItTextField().then {
        $0.placeholder = "비밀번호"
    }
    private let loginButton = FillButton(type: .system).then {
        $0.setTitle("로그인", for: .normal)
    }
}

extension LoginViewController {

    private func addView() {
        [
            logoImageView,
            loginLabel,
            loginTextField,
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
        loginTextField.snp.makeConstraints {
            $0.top.equalTo(loginLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.height.equalTo(49)
        }
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(loginTextField.snp.bottom).offset(15)
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
