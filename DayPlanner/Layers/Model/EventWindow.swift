import CalendarKit

final class EventVVV: EventDescriptor {
    var dateInterval = DateInterval()
    var isAllDay = false
    var text = ""
    var attributedText: NSAttributedString?
    var lineBreakMode: NSLineBreakMode?
    var font = UIFont.boldSystemFont(ofSize: 12)
    var color: UIColor
    var textColor = SystemColors.label
    var backgroundColor = SystemColors.systemBlue.withAlphaComponent(0.3)
    var editedEvent: CalendarKit.EventDescriptor?
    var description = ""
    var id: Int = 0

    init(
        id: Int,
        text: String,
        dateInterval: DateInterval,
        description: String,
        color: UIColor = .white
    ) {
        self.dateInterval = dateInterval
        self.text = text
        self.description = description
        self.id = id
        self.color = color
    }

    init(_ event: Event) {
        self.text = event.name
        self.description = event.description
        self.id = event.id
        self.color = .white
        self.dateInterval = DateInterval(
            start: Date(timeIntervalSince1970: event.dateStart),
            end: Date(timeIntervalSince1970: event.dateFinish)
        )
    }

    func makeEditable() -> EventVVV {
        return EventVVV(
            id: id,
            text: text,
            dateInterval: dateInterval,
            description: description
        )
    }

    func commitEditing() {
        guard let edited = editedEvent else { return }
        edited.dateInterval = dateInterval
    }
}
