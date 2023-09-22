import UIKit
import SnapKit
import Then

class TimeTableListCell: UICollectionViewCell {

    private let subject = UILabel().then {
        $0.text = ""
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setCell()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setCell() {
        self.addSubview(subject)

        subject.snp.makeConstraints {
            $0.top.equalToSuperview().inset(11)
            $0.leading.trailing.equalToSuperview().inset(14)
        }
    }
}
