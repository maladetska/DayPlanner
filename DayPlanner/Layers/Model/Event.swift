import Foundation
import RealmSwift

class Event: Object, Codable {
    @objc dynamic var id: Int // UUID() ?
    @objc dynamic var dateStart: TimeInterval // timestamp
    @objc dynamic var dateFinish: TimeInterval // timestamp
    @objc dynamic var name: String
    @objc dynamic var details: String?

    override static func primaryKey() -> String? { // разобраться
        return "id"
    }

    convenience init(event: [String: Any]) {
        self.init()

        self.id = event["id"] as! Int
        self.dateStart = event["date_start"] as! TimeInterval
            // Date(timeIntervalSince1970: event["date_start"] as! TimeInterval)
        self.dateFinish = event["date_finish"] as! TimeInterval
            // Date(timeIntervalSince1970: event["date_finish"] as! TimeInterval)
        self.name = event["name"] as! String
        self.details = event["description"] as? String // ?? ""
    }

//    func insertOrUpdate(event: Event) throws {
//        let realm = try! Realm()
//        try! realm.write {
//            let eventRealm = EventRealm()
//            eventRealm.id = event.id
//            eventRealm.dateStart = event.dateStart
//            eventRealm.dateFinish = event.dateFinish
//            eventRealm.name = event.name
//            eventRealm.details = event.details
//            realm.add(eventRealm) // realm.add(eventRealm, update: true)
//        }
//    }

//    func jsonToRealm(jsonData: JSONSerialization) throws {
//        let realm = try! Realm()
//        try! realm.write {
//            let json = try! JSONSerialization.jsonObject(with: jsonData, options: [])
//            realm.create(EventRealm.self, value: json, update: .modified)
//        }
//    }

//    func pizdec() throws {
//        let json = """
//            {
//                "events":
//                    [{
//                        "id": 1,
//                        "date_start": "147600000",
//                        "date_finish": "147610000",
//                        "name": "My task",
//                        "description": "Описание моего дела"
//                    },
//                    {
//                        "id": 2,
//                        "date_start": "1706785200",
//                        "date_finish": "1706785200",
//                        "name": "Second task",
//                        "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
//                    },
//                    {
//                        "id": 3,
//                        "date_start": "1706130000",
//                        "date_finish": "1706140800",
//                        "name": "Third task",
//                        "description": ""
//                    }]
//            }
//        """
//        guard let jsonDataWithKey = json.data(using: .utf8) else { return }
//
//        do {
//            if let json = try JSONSerialization.jsonObject(with: jsonDataWithKey) as? [String: AnyObject] {
//                if let eventArray = json["events"] as? [[String: AnyObject]] {
//                    let realm = try! Realm()
//                    for event in eventArray {
//                        let newEvent = EventRealm(event: event)
//                        try! realm.write {
//                            realm.add(newEvent)
//                        }
//                    }
//                }
//            }
//        } catch {
//            print("Error deserializing JSON: \(error)")
//        }
//    }
}
