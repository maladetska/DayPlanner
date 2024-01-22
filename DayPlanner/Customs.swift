import Foundation

let projectRoot = URL(fileURLWithPath: #file)
    .deletingLastPathComponent()
    .deletingLastPathComponent()
    .appendingPathComponent("ExampleData/events_data.json")
