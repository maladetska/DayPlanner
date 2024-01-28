import Foundation

let oneDayInterval: Double = 86400

let projectRoot = URL(fileURLWithPath: #file)
    .deletingLastPathComponent()
    .deletingLastPathComponent()
    .appendingPathComponent("ExampleData/events_data.json")
