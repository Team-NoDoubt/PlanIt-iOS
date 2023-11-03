import Foundation

struct ChangeDetailsList: Codable {
    let requestSubject: String
    let requestDate: String
    let requestPeriod: Int
    let requestTeacherName, replaceSubject: String
    let replaceDate: String
    let replacePeriod: Int
    let replaceTeacherName: String

    enum CodingKeys: String, CodingKey {
        case requestSubject = "request_subject"
        case requestDate = "request_date"
        case requestPeriod = "request_period"
        case requestTeacherName = "request_teacher"
        case replaceSubject = "changed_subject"
        case replaceDate = "changed_date"
        case replacePeriod = "changed_period"
        case replaceTeacherName = "changed_teacher"
    }
}

extension ChangeDetailsList {
    func toDomain() -> ChangedEntity {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let requestDateInDate = dateFormatter.date(from: self.requestDate) ?? Date()
        let replaceDateInDate = dateFormatter.date(from: self.replaceDate) ?? Date()
        dateFormatter.dateFormat = "MM월 dd일 (EEEE)"
        let requestDate = dateFormatter.string(from: requestDateInDate)
        let replaceDate = dateFormatter.string(from: replaceDateInDate)


        return .init(
            requestSubject: self.requestSubject,
            requestDate: requestDate,
            requestPeroid: self.requestPeriod,
            requestTeacherName: self.requestTeacherName,
            replaceSubject: self.replaceSubject,
            replaceDate: replaceDate,
            replacePeriod: self.replacePeriod,
            replaceTeacherName: self.replaceTeacherName
        )
    }
}
