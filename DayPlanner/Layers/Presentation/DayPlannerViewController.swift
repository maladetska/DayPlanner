import RealmSwift
import UIKit
import CalendarKit

class DayPlannerViewController: DayViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        realm.beginWrite()
//        realm.delete(realm.objects(EventRealm.self))
//        try! realm.commitWrite()

        title = "Day Planner"

        save()
        render()
    }

    func render() {
//        let events = realm.objects(EventRealm.self)
        // let event = DataBaseClient.getEventById(1)!
        // let events = realm.objects(Event.self)

      //  let event = DataBaseClient.getEventById(1)!

       // let calendar = UICalendarView()

        // for event in events {

//        let label = UILabel(frame: view.bounds)
//        label.text = "\(event.id) \n \(event.name) \n \(event.details)"
//        label.textAlignment = .center
//        label.numberOfLines = 0
//        view.addSubview(label)

        // }
    }

    func save() {
        DataInitializatior.initJsonInRealm(
            pathToJson: "/Users/maladetska/simbirsoft/DayPlanner/ExampleData/events_data.json"
        )
    }
}
