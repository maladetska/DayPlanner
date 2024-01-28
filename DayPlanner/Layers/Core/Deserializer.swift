import Foundation

protocol DeserializerProtocol {
    static func serializateJson(jsonDataWithKey: Data) throws -> [String: AnyObject]?
}

enum Deserializer: DeserializerProtocol {
    static func serializateJson(jsonDataWithKey: Data) throws -> [String: AnyObject]? {
        return try? JSONSerialization.jsonObject(with: jsonDataWithKey) as? [String: AnyObject]
    }
}
