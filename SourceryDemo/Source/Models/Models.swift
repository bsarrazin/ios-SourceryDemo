import Foundation
import UIKit

struct Person: AutoEquatable {
    let firstName: String
    let lastName: String
    let age: Int
    let pets: [Pet]
}

struct Pet: AutoEquatable {
    enum Kind { case cat, dog, fish }
    let kind: Kind
    let name: String
    let age: Int
}

struct Vehicle: AutoEquatable {
    enum Kind { case car, truck, van }
    let kind: Kind
    let colors: [UIColor]
    // sourcery: skipAutoEquatable
    let name: String?
    let serialNumber: String
}
