import UIKit

open class FillButton: UIButton {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .main
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 16, weight: .semibold)
        self.layer.cornerRadius = 10
        
    }

    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
