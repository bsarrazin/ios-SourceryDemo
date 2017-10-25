import Foundation

struct Person {
    let firstName: String
    let lastName: String
    let age: Int
    let pets: [Pet]
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
