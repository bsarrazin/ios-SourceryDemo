import Foundation

struct Person {
    let firstName: String
    let lastName: String
    let age: Int
    let pets: [Pet]
}

extension Person: Equatable {
    
    static func == (lhs: Person, rhs: Person) -> Bool {
        return
            lhs.firstName == rhs.firstName &&
            lhs.lastName == rhs.lastName &&
            lhs.age == rhs.age &&
            lhs.pets == rhs.pets
    }
    
}

struct Pet {
    enum Kind {
        case cat
        case dog
        case fish
    }
    
    let kind: Kind
    let name: String
    let age: Int
}

extension Pet: Equatable {
    
    static func == (lhs: Pet, rhs: Pet) -> Bool {
        return
            lhs.kind == rhs.kind &&
            lhs.name == rhs.name &&
            lhs.age == rhs.age
    }
    
}
