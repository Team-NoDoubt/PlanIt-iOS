import UIKit

public class PlanItTextField: UITextField {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        self.layer.borderColor = UIColor.gray350?.cgColor
        self.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: 0))
        self.leftViewMode = .always
        self.textColor = .gray800
        self.setPlaceholderTextColor(color: .gray300!)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PlanItTextField {
    func setPlaceholderTextColor(color: UIColor) {
        guard let string = self.placeholder else {
            return
        }
        attributedPlaceholder = NSAttributedString(string: string, attributes: [.foregroundColor: color])
    }
}
