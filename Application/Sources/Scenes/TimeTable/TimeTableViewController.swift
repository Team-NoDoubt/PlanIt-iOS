import UIKit
import SnapKit
import Then

class TimeTableViewController: UIViewController,ViewController {
    let days = ["월", "화", "수", "목", "금"]
    
    let viewModel = TimeTableViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        addView()
        setLayout()
        setDayLabels()
    
    }

    let timeTableLabel = UILabel().then {
        $0.text = "이번주 시간표"
        $0.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    }

    let timeTableView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 10
    }

    let dayLabels: [UILabel] = ["월", "화", "수", "목", "금"].map { day in
        let label = UILabel()
        label.text = day
        label.textAlignment = .center
        return label
    }

    let timeTableCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()).then {
//        $0.dataSource = self
//        $0.delegate = self
        $0.register(TimeTableListCell.self, forCellWithReuseIdentifier: "TimeTableListCell")
    }
    func setLayout() {
        timeTableLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(70)
            $0.leading.equalToSuperview().inset(37)
        }
        timeTableView.snp.makeConstraints {
            $0.top.equalTo(timeTableLabel.snp.bottom).offset(70)
            $0.leading.trailing.equalToSuperview().inset(30)
            $0.width.equalTo(330)
            $0.height.equalTo(500)
        }
        timeTableCollectionView.snp.makeConstraints {
            $0.top.equalTo(timeTableView.snp.top).offset(80)
            $0.leading.equalTo(timeTableView.snp.leading).offset(46)
        }
    }
    
    func addView() {
        [timeTableLabel,timeTableView, timeTableCollectionView].forEach { view.addSubview($0) }
    }
    func setDayLabels() {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually

        for label in dayLabels {
            stackView.addArrangedSubview(label)
        }
        
         stackView.translatesAutoresizingMaskIntoConstraints = false
        
         self.view.addSubview(stackView)
        
//         NSLayoutConstraint.activate([
//             stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//             stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//             stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//             stackView.heightAnchor.constraint(equalToConstant: 50)
//         ])
        stackView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(207)
            $0.leading.trailing.equalToSuperview().inset(50)
            $0.height.equalTo(40)
        }
    }
    
}

extension TimeTableViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

}
