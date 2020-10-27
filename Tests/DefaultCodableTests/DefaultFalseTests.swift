import XCTest
import DefaultCodable

class DefaultFalseTests: XCTestCase {
    struct Model: Equatable, Codable {
        @Default.False
        var flag: Bool
    }
    
    func testDecodingFailableArrayDefaultsToFalse() throws {
        let jsonData = #"{ "flag": null }"#.data(using: .utf8)!
        let model = try JSONDecoder().decode(Model.self, from: jsonData)
        XCTAssertEqual(model.flag, false)
    }

    func testDecodingKeyNotPresentDefaultsToFalse() throws {
        let jsonData = #"{}"#.data(using: .utf8)!
        let model = try JSONDecoder().decode(Model.self, from: jsonData)
        XCTAssertEqual(model.flag, false)
    }
    
    func testEncodingDecodedFailableArrayDefaultsToFalse() throws {
        let jsonData = #"{ "flag": null }"#.data(using: .utf8)!
        var _model = try JSONDecoder().decode(Model.self, from: jsonData)
        
        _model.flag = true
        
        let modelData = try JSONEncoder().encode(_model)
        let model = try JSONDecoder().decode(Model.self, from: modelData)
        XCTAssertEqual(model.flag, true)
    }
    
    func testEncodingDecodedFulfillableBoolRetainsValue() throws {
        let jsonData = #"{ "flag": true }"#.data(using: .utf8)!
        let _model = try JSONDecoder().decode(Model.self, from: jsonData)
        let modelData = try JSONEncoder().encode(_model)
        let model = try JSONDecoder().decode(Model.self, from: modelData)
        
        XCTAssertEqual(model.flag, true)
    }

    func testDecodingInvalidValueDecodesToDefaultValue() throws {
        let jsonData = #"{ "flag": "invalidValue" }"#.data(using: .utf8)!
        let model = try JSONDecoder().decode(Model.self, from: jsonData)
        XCTAssertEqual(
            model.flag,
            false,
            "Should fall in to the else block and return default value"
        )
    }
}
