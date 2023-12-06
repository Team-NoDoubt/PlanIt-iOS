import UIKit
import SnapKit
import Then
import PlanItDS

class SeeMoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addView()
        setLayout()
    }

    private let headerLabel = UILabel().then {
        $0.text = "더보기"
        $0.font = .pretendardFont(size: 20, weight: .medium)
    }

    private let bugReportButton = IconButton(
        imageName: PlanItIOSAsset.Assets.danger.name,
        title: "버그 신고"
    ).then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 5, height: 5)
        $0.layer.shadowRadius = 20
        $0.layer.shadowOpacity = 0.1
    }
    private let updatesButton = IconButton(
        imageName: PlanItIOSAsset.Assets.rocket.name,
        title: "업데이트 사항"
    ).then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.black.cgColor
        $0.layer.shadowOffset = CGSize(width: 5, height: 5)
        $0.layer.shadowRadius = 20
        $0.layer.shadowOpacity = 0.1
    }

    private func bind() {
        
    }

    private func addView() {
        [
            headerLabel,
            bugReportButton,
            updatesButton
        ].forEach { view.addSubview($0) }
        
    }

    private func setLayout() {
        headerLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(70)
            $0.leading.equalToSuperview().inset(37)
        }
        bugReportButton.snp.makeConstraints {
            $0.top.equalTo(headerLabel.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(28)
            $0.height.equalTo(50)
        }
        updatesButton.snp.makeConstraints {
            $0.top.equalTo(bugReportButton.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().inset(28)
            $0.height.equalTo(50)
        }

    }
}
