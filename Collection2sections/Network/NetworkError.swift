import Foundation

enum NetworkError: Error {
    case notConnected
    case timeout
    case badRequest
    case internalError
    case badFormat
    case unknown

    var title: String {
        switch self {
        case .notConnected:
            return "Strings.Error.NotConnected.title"
        default:
            return "Strings.Error.Generic.title"
        }
    }

    var message: String {
        switch self {
        case .notConnected:
            return "Strings.Error.NotConnected.message"
        default:
            return "Strings.Error.Generic.message"
        }
    }
}
