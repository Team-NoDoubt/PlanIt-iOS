import UIKit
import SnapKit
import Then

public class IconButton: UIButton {

    public init(imageName: String?, title: String) {
        super.init(frame: .zero)
        setUpButton(imageName: imageName ?? "", title: title)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setUpButton(imageName: String, title: String) {
        self.setImage(UIImage(named: imageName), for: .highlighted)
        self.setImage(UIImage(named: imageName), for: .normal)

        self.titleLabel?.font = .systemFont(ofSize: 16)
        self.setTitle(title, for: .normal)
        self.setTitleColor(.black, for: .normal)
        self.setTitleColor(.main, for: .highlighted)

        // inset
        self.contentHorizontalAlignment = .left
        self.contentEdgeInsets = .init(top: 3, left: 10, bottom: 0, right: 16)
        self.imageEdgeInsets = .init(top: 3, left: 10, bottom: 0, right: 16)
        self.titleEdgeInsets = .init(top: 0, left: 15, bottom: 0, right: 0)
        
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
