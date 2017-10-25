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
        let vehicle = Vehicle(kind: .car, name: "Lola", colors: [.black, .blue])
        let sut = Vehicle(kind: .car, name: "Lola", colors: [.black, .blue])
        XCTAssertTrue(sut == vehicle)
        
        let vehicle1 = Vehicle(kind: .car, name: "Lola", colors: [.black, .blue])
        let sut1 = Vehicle(kind: .car, name: nil, colors: [.black, .blue])
        XCTAssertFalse(sut1 == vehicle1)
        
        let vehicle2 = Vehicle(kind: .car, name: nil, colors: [.black, .blue])
        let sut2 = Vehicle(kind: .car, name: nil, colors: [.black, .blue])
        XCTAssertTrue(sut2 == vehicle2)
    }
    
}
