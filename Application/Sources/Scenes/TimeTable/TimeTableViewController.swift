import UIKit
import SnapKit
import Then
import PlanItDS
import RxSwift
import RxCocoa
import TimeTableService

class TimeTableViewController: UIViewController,ViewController {

    private let getTimeTable = PublishRelay<Void>()
    private let disposeBag = DisposeBag()
    
    var viewModel: TimeTableViewModel?

    init(viewModel: TimeTableViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        timeTableCollectionView.delegate = self
        addView()
        setLayout()
        bind()
    }
    override func viewWillAppear(_ animated: Bool) {
        getTimeTable.accept(())
    }
    
    let timeTableLabel = UILabel().then {
        $0.text = "이번주 시간표"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    }
    
    let timeTableView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
        $0.shadowTimeTable()
    }
    let weekView = WeekView()
    let collectionViewFlowLayout = UICollectionViewFlowLayout()
    
    lazy var timeTableCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewFlowLayout).then {
        $0.register(TimeTableCollectionViewCell.self, forCellWithReuseIdentifier: "TimeTableCollectionViewCell")
    }
    
    private func bind() {
        let input = TimeTableViewModel.Input(
            getTimeTableData: getTimeTable.asSignal()
        )
        let output = viewModel?.transform(input)
        output?.timTableList.bind(to: timeTableCollectionView.rx.items(cellIdentifier: "TimeTableCollectionViewCell", cellType: TimeTableCollectionViewCell.self)) { row, item, cell in
            cell.subject.text = "\(item.subject.makeReduce)"
        }.disposed(by: disposeBag)
    }
}

// MARK: Layout
extension TimeTableViewController {
    func setLayout() {
        timeTableLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(70)
            $0.leading.equalToSuperview().inset(37)
        }
        timeTableView.snp.makeConstraints {
            $0.top.equalTo(timeTableLabel.snp.bottom).offset(25)
            $0.width.equalTo(330)
            $0.centerX.equalToSuperview()
//            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-20)
            $0.height.equalTo(490)
        }
        weekView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalTo(timeTableCollectionView.snp.leading)
            $0.trailing.equalTo(timeTableCollectionView.snp.trailing)
            $0.width.equalTo(300)
            $0.height.equalTo(40)
        }
        timeTableCollectionView.snp.makeConstraints {
            $0.top.equalTo(weekView.snp.bottom)
            $0.trailing.equalToSuperview().inset(10)
            $0.height.equalTo(420)
            $0.width.equalTo(300)
        }
    }
    
    func addView() {
        [timeTableLabel,timeTableView].forEach { view.addSubview($0) }
        [weekView, timeTableCollectionView].forEach { timeTableView.addSubview($0) }
    }
}

extension TimeTableViewController: UICollectionViewDelegate {
    private func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TimeTableCollectionViewCell", for: indexPath) as? TimeTableCollectionViewCell else { return UICollectionViewCell()}
        return cell
    }
}

extension TimeTableViewController: UICollectionViewDelegateFlowLayout {
    
    // MARK: cellSize
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let cellItemForRow: CGFloat = 5
        let minimumSpacing: CGFloat = 0

        let width = (collectionViewWidth - (cellItemForRow - 1) * minimumSpacing) / cellItemForRow

        return CGSize(width: width, height: width)
    }

    // MARK: minimumSpacing
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
