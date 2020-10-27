import XCTest
@testable import DefaultCodable

class DefaultEmptyStringTests: XCTestCase {
    struct Model: Equatable, Codable {
        @Default.EmptyString
        var name: String
    }
    
    func testDecodingFailableStringDefaultsToEmpty() throws {
        let jsonData = #"{ "name": null }"#.data(using: .utf8)!
        let model = try JSONDecoder().decode(Model.self, from: jsonData)
        XCTAssertEqual(model.name, "")
    }
    
    func testDecodingKeyNotPresentDefaultsToEmpty() throws {
        let jsonData = #"{}"#.data(using: .utf8)!
        let model = try JSONDecoder().decode(Model.self, from: jsonData)
        XCTAssertEqual(model.name, "")
    }
    
    func testEncodingDecodedFailableStringDefaultsToEmpty() throws {
        let jsonData = #"{ "name": null }"#.data(using: .utf8)!
        var _model = try JSONDecoder().decode(Model.self, from: jsonData)
        
        _model.name = "DefaultCodable"
        
        let modelData = try JSONEncoder().encode(_model)
        let model = try JSONDecoder().decode(Model.self, from: modelData)
        XCTAssertEqual(model.name, "DefaultCodable")
    }
    
    func testEncodingDecodedFulfillableStringRetainsValue() throws {
        let jsonData = #"{ "name": "DefaultCodable" }"#.data(using: .utf8)!
        let _model = try JSONDecoder().decode(Model.self, from: jsonData)
        let modelData = try JSONEncoder().encode(_model)
        let model = try JSONDecoder().decode(Model.self, from: modelData)

        XCTAssertEqual(model.name, "DefaultCodable")
    }
}
