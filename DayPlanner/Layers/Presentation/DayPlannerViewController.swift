import CalendarKit
import RealmSwift
import UIKit

@available(iOS 13.0, *)
class DayPlannerViewController: DayViewController {
    var events = [EventWindow]()

    private lazy var barButton = UIBarButtonItem(
        barButtonSystemItem: .add,
        target: self,
        action: #selector(didTapAdd)
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Day Planner"
        navigationItem.rightBarButtonItem = barButton

        saveData()
        render()
    }

    override func eventsForDate(_ date: Date) -> [EventDescriptor] {
        return events
    }

    private func saveData() {
        DataInitializatior.initJsonToRealmDB(projectRoot)
    }

    private func saveData(_ event: Event) {
        DataInitializatior.addEventToRealmDB(event)
    }

    private func render() {
        let allEvents = DataBaseClient.getAllEvents()

        if !allEvents.isEmpty {
            for event in allEvents {
                events.append(EventWindow(event!))
            }
        }
    }

    // MARK: Unrealised

    @available(iOS 13.0, *)
    @IBAction func didTapAdd() {
        let viewController = storyboard?
            .instantiateViewController(identifier: "entry") as! EntryEventViewController
        viewController.title = "New Event"
        viewController.update = {
            DispatchQueue.main.async {
                self.saveData()
            }
        }

        navigationController?.pushViewController(viewController, animated: true)
    }
}
