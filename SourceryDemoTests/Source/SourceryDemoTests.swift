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
    
}
