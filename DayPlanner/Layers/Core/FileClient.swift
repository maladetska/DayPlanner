import Foundation

protocol FileClientProtocol: AnyObject {
    static func getTextByPath(path: String) throws -> String
}

enum FileClient {
    enum FileClienError: Error {
        case invalid
    }

    static func getTextByPath(path: String) throws -> String {
        guard let text = try? String(contentsOfFile: path, encoding: .utf8) else {
            throw FileClienError.invalid // ПОДУМАЙЙЙЙЙ
        }

        return text
    }
}
