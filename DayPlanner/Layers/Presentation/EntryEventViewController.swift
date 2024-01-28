import Foundation
import UIKit

// MARK: Unrealised

class EntryEventViewController: UIViewController {
    @IBOutlet var fieldName: UILabel!
    @IBOutlet var fieldDescription: UILabel!
    @IBOutlet var textName: UITextField!
    @IBOutlet var textDescription: UITextField!
    @IBOutlet var fieldStart: UILabel!
    @IBOutlet var fieldFinish: UILabel!
    @IBOutlet var dateStart: UIDatePicker!
    @IBOutlet var dateFinish: UIDatePicker!
    @IBOutlet var addButton: UIButton!

    var update: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Event"

//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            title: "Save",
//            style: .done,
//            target: self,
//            action: #selector(saveTask)
//        )
    }

    @objc func saveTask() {
        update?()

        navigationController?.popViewController(animated: true)
    }
}
