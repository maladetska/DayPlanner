import RealmSwift

class Event: Object, Codable {
    @objc dynamic var id: Int
    @objc dynamic var dateStart: TimeInterval
    @objc dynamic var dateFinish: TimeInterval
    @objc dynamic var name: String
    @objc dynamic var details: String

    override static func primaryKey() -> String? {
        return "id"
    }

    enum CodingKeys: String, CodingKey {
        case id
        case dateStart = "date_start"
        case dateFinish = "date_finish"
        case name
        case details = "description"
    }

    convenience init(_ event: [String: Any]) {
        self.init()

        self.id = event[CodingKeys.id.rawValue] as! Int
        self.dateStart = Double(event[CodingKeys.dateStart.rawValue] as! String) ?? 0
        self.dateFinish = Double(event[CodingKeys.dateFinish.rawValue] as! String) ?? 0
        self.name = event[CodingKeys.name.rawValue] as! String
        self.details = event[CodingKeys.details.rawValue] as? String ?? ""
    }
}
