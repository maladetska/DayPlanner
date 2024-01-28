import CalendarKit

final class EventWindow: EventDescriptor {
    var id: Int
    var text: String
    var details: String
    var dateInterval = DateInterval()

    var isAllDay = false
    var attributedText: NSAttributedString?
    var lineBreakMode: NSLineBreakMode?
    var font: UIFont = .boldSystemFont(ofSize: 12)
    var color: UIColor = .white
    var textColor: UIColor = SystemColors.label
    var backgroundColor: UIColor = SystemColors.systemBlue.withAlphaComponent(1 / 5)
    var editedEvent: CalendarKit.EventDescriptor?

    init(
        id: Int,
        dateInterval: DateInterval,
        text: String,
        details: String
    ) {
        self.id = id
        self.dateInterval = dateInterval
        self.text = text
        self.details = details
    }

    init(_ event: Event) {
        self.id = event.id
        self.dateInterval = DateInterval(
            start: Date(timeIntervalSince1970: event.dateStart),
            end: Date(timeIntervalSince1970: event.dateFinish)
        )
        self.text = event.name
        self.details = event.details
    }

    func makeEditable() -> EventWindow {
        return EventWindow(
            id: id,
            dateInterval: dateInterval,
            text: text,
            details: details
        )
    }

    func commitEditing() {
        if let edited = editedEvent {
            edited.dateInterval = dateInterval
        }
    }
}
