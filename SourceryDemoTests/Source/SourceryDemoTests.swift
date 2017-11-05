import XCTest
@testable import SourceryDemo

class SourceryDemoTests: XCTestCase {
    
    func test_PetEquality() {
        let pet = Pet(kind: .dog, name: "Rex", age: 2)
        let sut = Pet(kind: .dog, name: "Rex", age: 2)
        XCTAssertTrue(sut == pet)
    }
    
    func test_PersonEquality() {
        let pet = Pet(kind: .dog, name: "Rex", age: 2)
        let person = Person(firstName: "Clark",
                            lastName: "Kent",
                            age: 32,
                            pets: [pet])
        
        let sut = Person(firstName: "Clark",
                            lastName: "Kent",
                            age: 32,
                            pets: [Pet(kind: .dog, name: "Rex", age: 2)])
        
        XCTAssertTrue(sut == person)
    }
    
    func test_VehicleEquality() {
        let vehicle = Vehicle(kind: .car, colors: [.black, .blue], name: "Lola", serialNumber: "abc123")
        let sut = Vehicle(kind: .car, colors: [.black, .blue], name: "Lola", serialNumber: "abc123")
        XCTAssertTrue(sut == vehicle)
        
        let vehicle1 = Vehicle(kind: .car, colors: [.black, .blue], name: "Local", serialNumber: "abc123")
        let sut1 = Vehicle(kind: .car, colors: [.black, .blue], name: nil, serialNumber: "abc123")
        XCTAssertTrue(sut1 == vehicle1)
        
        let vehicle2 = Vehicle(kind: .car, colors: [.black, .blue], name: nil, serialNumber: "abc123")
        let sut2 = Vehicle(kind: .car, colors: [.black, .blue], name: nil, serialNumber: "abc123")
        XCTAssertTrue(sut2 == vehicle2)
    }
    
    func test_PetEncodability() {
        let pet = Pet(kind: .cat, name: "Felix", age: 18)
        let encoder = JSONEncoder()
        let data = try! encoder.encode(pet)
        let string = String(data: data, encoding: .utf8)!
        XCTAssertEqual(string, "{\"type\":\"cat\",\"name\":\"Felix\",\"age\":18}")
    }
    
    func test_PetDecodability() {
        let string = "{\"type\":\"cat\",\"name\":\"Felix\",\"age\":18}"
        let data = string.data(using: .utf8)!
        let decoder = JSONDecoder()
        let sut = try! decoder.decode(Pet.self, from: data)
        XCTAssertTrue(sut.age == 18)
        XCTAssertTrue(sut.kind == .cat)
        XCTAssertTrue(sut.name == "Felix")
    }
    
    func test_PersonEncodability() {
        let pet = Pet(kind: .cat, name: "Felix", age: 18)
        let person = Person(firstName: "Wade", lastName: "Wilson", age: 35, pets: [pet])
        let encoder = JSONEncoder()
        let data = try! encoder.encode(person)
        let string = String(data: data, encoding: .utf8)!
        XCTAssertEqual(string, "{\"age\":35,\"last_name\":\"Wilson\",\"pets\":[{\"type\":\"cat\",\"name\":\"Felix\",\"age\":18}],\"first_name\":\"Wade\"}")
    }
    
    func test_PersonDecodability() {
        let string = "{\"first_name\":\"Wade\",\"age\":35,\"last_name\":\"Wilson\",\"pets\":[{\"type\":\"cat\",\"name\":\"Felix\",\"age\":18}]}"
        let data = string.data(using: .utf8)!
        let decoder = JSONDecoder()
        let sut = try! decoder.decode(Person.self, from: data)
        XCTAssertTrue(sut.age == 35)
        XCTAssertTrue(sut.firstName == "Wade")
        XCTAssertTrue(sut.lastName == "Wilson")
        XCTAssertTrue(sut.pets.count == 1)
        XCTAssertTrue(sut.pets.first != nil)
        XCTAssertTrue(sut.pets.first!.age == 18)
        XCTAssertTrue(sut.pets.first!.kind == .cat)
        XCTAssertTrue(sut.pets.first!.name == "Felix")
    }
    
}
