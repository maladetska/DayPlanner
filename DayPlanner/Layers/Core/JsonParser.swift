import Foundation

protocol JsonParserProtocol: AnyObject {
    static func parseJsonStringToData(jsonString: String) -> Data?
}

enum JsonParser {
    static func parseJsonStringToData(jsonString: String) -> Data? {
        return jsonString.data(using: .utf8)
    }
}
