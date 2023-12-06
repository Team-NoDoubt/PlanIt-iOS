import UIKit
import Then
import SnapKit
import PlanItDS

class ChangedTableViewCell: UITableViewCell {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.selectionStyle = .none
        setUp()
    }

    let backgroundCellView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.layer.shadowColor = UIColor.black.withAlphaComponent(0.25).cgColor
        $0.layer.shadowRadius = 4
        $0.setShadow()
    }
    var beforeSubject = UILabel().then {
        $0.text = ""
        $0.font = .pretendardFont(size: 12, weight: .medium)
        $0.textColor = .black
    }
    var beforePeroid = UILabel().then {
        $0.text = ""
        $0.font = .pretendardFont(size: 8, weight: .regular)
        $0.textColor = .gray500
    }
    let arrowImageView = UIImageView().then {
        $0.image = UIImage(systemName: "arrow.right")
        $0.tintColor = .main
    }
    var replaceSubject = UILabel().then {
        $0.text = ""
        $0.font = .pretendardFont(size: 12, weight: .medium)
        $0.textColor = .black
    }
    var replacePeroid = UILabel().then {
        $0.text = ""
        $0.font = .pretendardFont(size: 8, weight: .regular)
        $0.textColor = .gray500
    }
}

extension ChangedTableViewCell {
    func setUp() {
        addSubview(backgroundCellView)
        [
            arrowImageView,
            beforeSubject,
            beforePeroid,
            replaceSubject,
            replacePeroid
        ].forEach {backgroundCellView.addSubview($0)}
        
        backgroundCellView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(2)
            $0.top.equalToSuperview().inset(3)
            $0.bottom.equalToSuperview().inset(3)
        }
        arrowImageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalTo(18)
            $0.width.equalTo(18)
        }
        beforeSubject.snp.makeConstraints {
            $0.trailing.equalTo(arrowImageView.snp.leading).offset(-20)
            $0.top.equalTo(arrowImageView.snp.top)
            $0.height.equalTo(18)
        }
        beforePeroid.snp.makeConstraints {
            $0.top.equalTo(beforeSubject.snp.bottom)
            $0.centerX.equalTo(beforeSubject)
            $0.height.equalTo(10)
        }
        replaceSubject.snp.makeConstraints {
            $0.top.equalTo(arrowImageView.snp.top)
            $0.leading.equalTo(arrowImageView.snp.trailing).offset(20)
            $0.height.equalTo(18)
        }
        replacePeroid.snp.makeConstraints {
            $0.top.equalTo(replaceSubject.snp.bottom)
            $0.centerX.equalTo(replaceSubject)
            $0.height.equalTo(10)
        }
    }
    func shadow() {
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 10 / 2.0
        layer.shadowOpacity = Float(0.1)
        layer.shadowColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1).cgColor
    }
}
