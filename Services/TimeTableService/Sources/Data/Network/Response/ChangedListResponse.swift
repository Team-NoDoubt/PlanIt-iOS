import Foundation

struct ChangedListResponse: Codable {
    let changeDetailsList: [ChangeDetailsList]

    enum CodingKeys: String, CodingKey {
        case changeDetailsList = "changed_timetable_list"
    }
}

extension ChangedListResponse {
    func toDomain() ->[ChangedEntity] {
        return self.changeDetailsList.map {
            $0.toDomain()
        }
    }
}
