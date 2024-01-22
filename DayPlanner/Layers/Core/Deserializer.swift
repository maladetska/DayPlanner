import Foundation

protocol DeserializerProtocol: AnyObject {
    static func serializateJson(jsonDataWithKey: Data) -> [String: AnyObject]
}

enum Deserializer {
    static func serializateJson(jsonDataWithKey: Data) -> [String: AnyObject] {
        return try! JSONSerialization.jsonObject(with: jsonDataWithKey) as! [String: AnyObject]
        // разобраться с ошибками^ может [String: AnyObject]? ??????
    }
}
