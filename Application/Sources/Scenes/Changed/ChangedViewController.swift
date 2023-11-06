import UIKit
import SnapKit
import Then
import RxSwift
import RxCocoa
import PlanItDS

class ChangedViewController: UIViewController {

    private let getChangedList = PublishRelay<Void>()
    private let disposeBag = DisposeBag()

    var viewModel: ChangedViewModel?

    init(viewModel: ChangedViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewWillAppear(_ animated: Bool) {
        getChangedList.accept(())
    }

    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        changedTableView.delegate = self
        addView()
        setLayout()
        bind()
    }
    
    private let headerLabel = UILabel().then {
        $0.text = "교체내역"
        $0.font = UIFont.pretendardFont(size: 20, weight: .medium)
    }
    private let changedTableView = UITableView().then {
        $0.register(ChangedTableViewCell.self, forCellReuseIdentifier: "ChangedTableViewCell")
        $0.showsVerticalScrollIndicator = false
        $0.separatorStyle = .none
        $0.rowHeight = 60
    }
    private func bind() {
        let input = ChangedViewModel.Input(
            getChangedListData: getChangedList.asSignal()
        )
        let output = viewModel?.transform(input)
        output?.changedList.bind(to: changedTableView.rx.items(cellIdentifier: "ChangedTableViewCell", cellType: ChangedTableViewCell.self)) { row, item, cell in
            cell.beforeSubject.text = "\(item.requestPeroid)교시: \(item.requestSubject)"
            cell.beforePeroid.text = "\(item.requestDate): \(item.requestPeroid)교시"
            cell.replaceSubject.text = "\(item.replacePeriod)교시: \(item.replaceSubject)"
            cell.replacePeroid.text = "\(item.replaceDate): \(item.replacePeriod)교시"
        }
    }
}

extension ChangedViewController {
    func addView() {
        [
            headerLabel,
            changedTableView
        ].forEach { view.addSubview($0) }
    }
    func setLayout() {
        headerLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(70)
            $0.leading.equalToSuperview().inset(37)
        }
        changedTableView.snp.makeConstraints {
            $0.top.equalTo(headerLabel.snp.bottom).offset(50)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
extension ChangedViewController: UITableViewDelegate {
    private func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ChangedTableViewCell", for: indexPath) as? ChangedTableViewCell else { return UITableViewCell()}
        return cell
    }
}
