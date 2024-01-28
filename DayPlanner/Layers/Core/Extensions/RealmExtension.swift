import RealmSwift

public extension Realm {
    static func safeInit() -> Realm? {
        do {
            let realm = try Realm()
            return realm
        } catch {
            // LOG ERROR
        }
        return nil
    }

    func safeWrite(_ block: () throws -> Void) throws {
        if isInWriteTransaction {
            try block()
        } else {
            try write(block)
        }
    }
}
