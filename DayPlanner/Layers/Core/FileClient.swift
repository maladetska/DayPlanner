import Foundation

protocol FileClientProtocol {
    static func getTextByPath(path: URL) throws -> String?
}

enum FileClient: FileClientProtocol {
    static func getTextByPath(path: URL) throws -> String? {
        return try? String(contentsOf: path, encoding: .utf8)
    }
}
