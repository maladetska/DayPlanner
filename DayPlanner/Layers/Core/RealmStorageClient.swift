import RealmSwift

protocol RealmStorageClientProtocol {
    static func cleanStorage()
    static func putEventToStorage(_ event: Event)
    static func putEventsToStorage(eventArray: [[String: AnyObject]])
    static func getAllEvents() -> [Event?]
    static func getEventById(_ id: Int) -> Event?
    static func getEventsByParameter(paramName: String, paramValue: Any, _ comaratorSign: String) -> Set<Event?>
}

enum RealmStorageClient: RealmStorageClientProtocol {
    static func cleanStorage() {
        let realm = Realm.safeInit()!

        try! realm.safeWrite {
            realm.delete(realm.objects(Event.self))
        }
    }

    static func putEventToStorage(_ event: Event) {
        let realm = Realm.safeInit()!

        try! realm.safeWrite {
            realm.add(event)
        }
    }

    static func putEventsToStorage(eventArray: [[String: AnyObject]]) {
        for event in eventArray {
            putEventToStorage(Event(event))
        }
    }

    static func getAllEvents() -> [Event?] {
        let realm = Realm.safeInit()!

        return Array(realm.objects(Event.self))
    }

    static func getEventById(_ id: Int) -> Event? {
        let realm = Realm.safeInit()!

        return realm.object(ofType: Event.self, forPrimaryKey: id)
    }

    static func getEventsByParameter(paramName: String, paramValue: Any, _ comaratorSign: String) -> Set<Event?> {
        let realm = Realm.safeInit()!

        let allEvents = realm.objects(Event.self)
        return Set(allEvents.filter("\(paramName) \(comaratorSign) \(paramValue)"))
    }
}
