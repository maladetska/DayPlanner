import Foundation

protocol DataBaseClientProtocol {
    static func getAllEvents() -> [Event?]
    static func getEventById(_ id: Int) -> Event?
    static func getEventsByDate(_ timeinterval: TimeInterval) -> [Event?]
}

enum DataBaseClient {
    static func getAllEvents() -> [Event?] {
        return RealmStorageClient.getAllEvents()
    }

    static func getEventById(_ id: Int) -> Event? {
        return RealmStorageClient.getEventById(id)
    }

    static func getEventsByDate(_ day: TimeInterval) -> [Event?] {
        let eventsAfterStartOfDay = RealmStorageClient.getEventsByParameter(
            paramName: Event.CodingKeys.dateStart.rawValue,
            paramValue: day,
            ">="
        )
        let eventsUntilEndOfDay = RealmStorageClient.getEventsByParameter(
            paramName: Event.CodingKeys.dateFinish.rawValue,
            paramValue: day + oneDayInterval,
            "<"
        )

        return Array(eventsAfterStartOfDay.intersection(eventsUntilEndOfDay))
    }
}
