import UIKit

public extension UIView {
    func shadowTimeTable() {
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 10 / 2.0
        layer.shadowOpacity = Float(0.1)
        layer.shadowColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1).cgColor
    }
    func setShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.25
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 2
    }
}
