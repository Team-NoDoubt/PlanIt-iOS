import UIKit

public extension UIFont {
    enum weight {
        case black
        case bold
        case extraBold
        case extraLight
        case light
        case medium
        case regular
        case semibold
        case thin
    }

    static func pretendardFont(size: CGFloat, weight: weight) -> UIFont {
        switch weight {
        case .black:
            return PlanItDSFontFamily.Pretendard.black.font(size: size)
        case .bold:
            return PlanItDSFontFamily.Pretendard.bold.font(size: size)
        case .extraBold:
            return PlanItDSFontFamily.Pretendard.extraBold.font(size: size)
        case .extraLight:
            return PlanItDSFontFamily.Pretendard.extraLight.font(size: size)
        case .light:
            return PlanItDSFontFamily.Pretendard.light.font(size: size)
        case .medium:
            return PlanItDSFontFamily.Pretendard.medium.font(size: size)
        case .regular:
            return PlanItDSFontFamily.Pretendard.regular.font(size: size)
        case .semibold:
            return PlanItDSFontFamily.Pretendard.semiBold.font(size: size)
        case .thin:
            return PlanItDSFontFamily.Pretendard.thin.font(size: size)
        }
    }
}

