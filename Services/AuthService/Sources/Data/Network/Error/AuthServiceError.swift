import Foundation

public enum AuthServiceError: Error {
    case badRequest
    case unauthorized
    case forbidden
    case notfound
    case conflict
    case toomanyrequest
    case internalServerError
}

