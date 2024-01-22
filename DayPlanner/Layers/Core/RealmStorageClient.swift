import RealmSwift

protocol RealmStorageClientProtocol {
    static func cleanStorage()
    static func putEventArrayToStorage(eventArray: [[String: AnyObject]])
    static func getAllEvents() -> [Event?]
    static func getEventById(_ id: Int) -> Event?
    static func getEventsByParameter(paramName: String, paramValue: Any, _ comaratorSign: String) -> Set<Event?>
}

enum RealmStorageClient: RealmStorageClientProtocol {
    static func cleanStorage() {
        let realm = try! Realm()

        realm.beginWrite()
        realm.delete(realm.objects(Event.self))
    }

    static func putEventArrayToStorage(eventArray: [[String: AnyObject]]) {
        let realm = try! Realm()

        for event in eventArray {
            let newEvent = Event(event: event)
            try! realm.safeWrite {
                realm.add(newEvent)
            }
        }
        try! realm.commitWrite()
    }

    static func getAllEvents() -> [Event?] {
        let realm = try! Realm()

        return Array(realm.objects(Event.self))
    }

    static func getEventById(_ id: Int) -> Event? {
        let realm = try! Realm()

        return realm.object(ofType: Event.self, forPrimaryKey: id)
    }

    static func getEventsByParameter(paramName: String, paramValue: Any, _ comaratorSign: String) -> Set<Event?> {
        let realm = try! Realm()

        let allEvents = realm.objects(Event.self)
        return Set(allEvents.filter("\(paramName) \(comaratorSign) \(paramValue)"))
    }
}
