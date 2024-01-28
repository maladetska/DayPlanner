import Foundation

protocol JsonParserProtocol {
    static func parseJsonStringToData(jsonString: String) -> Data?
}

enum JsonParser: JsonParserProtocol {
    static func parseJsonStringToData(jsonString: String) -> Data? {
        return jsonString.data(using: .utf8)
    }
}
