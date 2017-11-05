// Generated using Sourcery 0.9.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import UIKit

extension Person: Codable {

    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case age
        case pets
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        firstName = try values.decode(String.self, forKey: .firstName)
        lastName = try values.decode(String.self, forKey: .lastName)
        age = try values.decode(Int.self, forKey: .age)
        pets = try values.decode([Pet].self, forKey: .pets)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(firstName, forKey: .firstName)
        try container.encode(lastName, forKey: .lastName)
        try container.encode(age, forKey: .age)
        try container.encode(pets, forKey: .pets)
    }

}

extension Pet: Codable {

    enum CodingKeys: String, CodingKey {
        case kind = "type"
        case name
        case age
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        kind = try values.decode(Kind.self, forKey: .kind)
        name = try values.decode(String.self, forKey: .name)
        age = try values.decode(Int.self, forKey: .age)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(kind, forKey: .kind)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age)
    }

}

extension Vehicle: Codable {

    enum CodingKeys: String, CodingKey {
        case kind = "type"
        case colors
        case name
        case serialNumber
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        kind = try values.decode(Kind.self, forKey: .kind)
        colors = try values.decode([UIColor].self, forKey: .colors)
        name = try values.decode(String?.self, forKey: .name)
        serialNumber = try values.decode(String.self, forKey: .serialNumber)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(kind, forKey: .kind)
        try container.encode(colors, forKey: .colors)
        try container.encode(name, forKey: .name)
        try container.encode(serialNumber, forKey: .serialNumber)
    }

}

