import UIKit

public extension UIView {
    public func shadowTimeTable() {
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 10 / 2.0
        layer.shadowOpacity = Float(0.1)
        layer.shadowColor = UIColor(red: 101/255, green: 101/255, blue: 101/255, alpha: 1).cgColor
    }
}
