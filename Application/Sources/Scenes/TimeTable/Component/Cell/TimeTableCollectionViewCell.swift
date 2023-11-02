import UIKit
import SnapKit
import Then
import PlanItDS

class TimeTableCollectionViewCell: UICollectionViewCell {

    var subject = UILabel().then {
        $0.text = ""
        $0.font = .systemFont(ofSize: 16, weight: .bold)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.gray200?.cgColor
        setCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setCell() {
        self.addSubview(subject)

        subject.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
