import Foundation
import UIKit

struct Person: AutoEncodable, AutoEquatable {
    // sourcery: AutoEncodableKey = "first_name"
    let firstName: String
    // sourcery: AutoEncodableKey = "last_name"
    let lastName: String
    let age: Int
    let pets: [Pet]
}

struct Pet: AutoEncodable, AutoEquatable {
    enum Kind: String, Codable {
         case cat
         case dog
         case fish
    }
    // sourcery: AutoEncodableKey = "type"
    let kind: Kind
    let name: String
    let age: Int
}

struct Vehicle: AutoEncodable, AutoEquatable {
    enum Kind: String, Codable {
        case car
        case truck
        case van
    }
    // sourcery: AutoEncodableKey = "type"
    let kind: Kind
    let colors: [UIColor]
    // sourcery: skipAutoEquatable
    let name: String?
    let serialNumber: String
}
