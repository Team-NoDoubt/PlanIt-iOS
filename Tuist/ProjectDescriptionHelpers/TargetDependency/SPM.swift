import ProjectDescription

extension TargetDependency {
    public struct SPM {

        public static let Moya = TargetDependency.external(name: "Moya")
        public static let RxCocoa = TargetDependency.external(name: "RxCocoa")
        public static let RxMoya = TargetDependency.external(name: "RxMoya")
        public static let RxSwift = TargetDependency.external(name: "RxSwift")

        public static let Then = TargetDependency.external(name: "Then")
        public static let SnapKit = TargetDependency.external(name: "SnapKit")

        static let Kingfisher = TargetDependency.external(name: "Kingfisher")

        static let RxFlow = TargetDependency.external(name: "RxFlow")
    }
}
