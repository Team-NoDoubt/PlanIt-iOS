import Foundation

public struct ChangedEntity: Equatable {
    public let requestSubject: String
    public let requestDate: String
    public let requestPeroid: Int
    public let requestTeacherName: String
    public let replaceSubject: String
    public let replaceDate: String
    public let replacePeriod: Int
    public let replaceTeacherName: String
}

