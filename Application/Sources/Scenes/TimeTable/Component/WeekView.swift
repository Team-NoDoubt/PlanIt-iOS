import UIKit
import PlanItDS
import Then
import SnapKit

class WeekView: UIView {

    private let monLabel = UILabel().then {
        $0.text = "월"
        $0.textColor = .gray500
    }
    private let tueLabel = UILabel().then {
        $0.text = "화"
        $0.textColor = .gray500
    }
    private let wedLabel = UILabel().then {
        $0.text = "수"
        $0.textColor = .gray500
    }
    private let thuLabel = UILabel().then {
        $0.text = "목"
        $0.textColor = .gray500
    }
    private let friLabel = UILabel().then {
        $0.text = "금"
        $0.textColor = .gray500
    }

    override func layoutSubviews() {
        addView()
        setLayout()
    }

    func addView() {
        [
            monLabel,
            tueLabel,
            wedLabel,
            thuLabel,
            friLabel
        ].forEach { self.addSubview($0) }
    }

    func setLayout() {
        monLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(21.38)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(30)
        }
        tueLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(monLabel.snp.trailing).offset(45)
            $0.height.equalTo(30)
        }
        wedLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(tueLabel.snp.trailing).offset(45)
            $0.height.equalTo(30)
        }
        thuLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(wedLabel.snp.trailing).offset(45)
            $0.height.equalTo(30)
        }
        friLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(thuLabel.snp.trailing).offset(45)
            $0.height.equalTo(30)
        }
    }
}
