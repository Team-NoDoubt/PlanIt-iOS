import Foundation
import RxSwift

protocol ViewModelType {

    associatedtype Input
    associatedtype Output

    var disposeBag: DisposeBag { get set }

    func transform(_ input: Input) -> Output

}
