// Generated using Sourcery 0.9.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


extension Person: Equatable {
    static func == (lhs: Person, rhs: Person) -> Bool {
        guard lhs.firstName == rhs.firstName else { return false }
        guard lhs.lastName == rhs.lastName else { return false }
        guard lhs.age == rhs.age else { return false }
        guard lhs.pets == rhs.pets else { return false }
        return true
    }
}
extension Pet: Equatable {
    static func == (lhs: Pet, rhs: Pet) -> Bool {
        guard lhs.kind == rhs.kind else { return false }
        guard lhs.name == rhs.name else { return false }
        guard lhs.age == rhs.age else { return false }
        return true
    }
}
extension Vehicle: Equatable {
    static func == (lhs: Vehicle, rhs: Vehicle) -> Bool {
        guard lhs.kind == rhs.kind else { return false }
        guard lhs.colors == rhs.colors else { return false }
        guard lhs.serialNumber == rhs.serialNumber else { return false }
        return true
    }
}
