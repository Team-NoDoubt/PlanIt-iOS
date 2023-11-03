import Foundation

public enum Subject: String {
    case operatingSystem = "운영체제"
    case successJob = "성공적인직업생활"
    case dataBase = "데이터베이스"
    case literature = "문학"
    case koreanHistory = "한국사"
    case mathOne = "수학1"
    case java = "자바프로그래밍"
    case creativeLearning = "창의적체험학습 "
    case selectSubject = "인공지능론"
    case exerciseAndHealth = "운동과건강"
    case english1 = "영어1"
    case NONE = ""

    public var makeReduce: String {
        switch self {
        case .operatingSystem:
            return "운체"
        case .dataBase:
            return "데베"
        case .successJob:
            return "성직"
        case .literature:
            return "문학"
        case .koreanHistory:
            return "한국사"
        case .java:
            return "자바"
        case .mathOne:
            return "수학1"
        case .creativeLearning:
            return "창체"
        case .selectSubject:
            return "선택과목"
        case .exerciseAndHealth:
            return "운건"
        case .english1:
            return "영어1"
        case .NONE:
            return ""
        }
    }
}
