import Foundation

protocol DataInitializatiorProtocol {
    static func initJsonToRealmDB(_ pathToJson: URL)
    static func addJsonToRealmDB(_ pathToJson: URL)
    static func addEventToRealmDB(_ event: Event)
}

enum DataInitializatior: DataInitializatiorProtocol {
    static func initJsonToRealmDB(_ pathToJson: URL) {
        RealmStorageClient.cleanStorage()
        addJsonToRealmDB(pathToJson)
    }

    static func addJsonToRealmDB(_ pathToJson: URL) {
        guard let jsonString = try? FileClient.getTextByPath(path: pathToJson) else { return }
        guard let jsonDataWithKey = JsonParser.parseJsonStringToData(jsonString: jsonString) else { return }
        guard let eventArray = try? Deserializer.serializateJson(jsonDataWithKey: jsonDataWithKey) else { return }
        RealmStorageClient.putEventsToStorage(eventArray: eventArray["events"] as! [[String: AnyObject]])
    }

    static func addEventToRealmDB(_ event: Event) {
        RealmStorageClient.putEventToStorage(event)
    }
}
