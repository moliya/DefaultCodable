import XCTest
import DefaultCodable

class DefaultEmptyDictionaryTests: XCTestCase {
    struct Model: Equatable, Codable {
        @Default.EmptyDictionary
        var stringToInt: [String: Int]
    }
    
    func testDecodingFailableDictionaryDefaultsToEmptyDictionary() throws {
        let jsonData = #"{ "stringToInt": null }"#.data(using: .utf8)!
        let model = try JSONDecoder().decode(Model.self, from: jsonData)
        XCTAssertEqual(model.stringToInt, [:])
    }

    func testDecodingKeyNotPresentDefaultsToEmptyDictionary() throws {
        let jsonData = #"{}"#.data(using: .utf8)!
        let model = try JSONDecoder().decode(Model.self, from: jsonData)
        XCTAssertEqual(model.stringToInt, [:])
    }
    
    func testEncodingDecodedFailableDictionaryDefaultsToEmptyDictionary() throws {
        let jsonData = #"{ "stringToInt": null }"#.data(using: .utf8)!
        var _model = try JSONDecoder().decode(Model.self, from: jsonData)

        _model.stringToInt["one"] = 1
        
        let modelData = try JSONEncoder().encode(_model)
        let model = try JSONDecoder().decode(Model.self, from: modelData)
        XCTAssertEqual(model.stringToInt, ["one": 1])
    }
    
    func testEncodingDecodedFulfillableDictionaryRetainsContents() throws {
        let jsonData = #"{ "stringToInt": {"one": 1, "two": 2} }"#.data(using: .utf8)!
        let _model = try JSONDecoder().decode(Model.self, from: jsonData)
        let modelData = try JSONEncoder().encode(_model)
        let model = try JSONDecoder().decode(Model.self, from: modelData)
        XCTAssertEqual(model.stringToInt, ["one": 1, "two": 2])
    }
}
