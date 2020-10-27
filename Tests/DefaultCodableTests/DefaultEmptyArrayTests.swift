import XCTest
import DefaultCodable

class DefaultEmptyArrayTests: XCTestCase {
    struct Model: Equatable, Codable {
        struct NestedModel: Equatable, Codable {
            var one: String
            var two: [String: [String]]
        }
        
        @Default.EmptyArray
        var values: [Int]
        
        @Default.EmptyArray
        var nonPrimitiveValues: [NestedModel]
    }
    
    func testDecodingFailableArrayDefaultsToEmptyArray() throws {
        let jsonData = #"{ "values": null, "nonPrimitiveValues": null }"#.data(using: .utf8)!
        let model = try JSONDecoder().decode(Model.self, from: jsonData)
        XCTAssertEqual(model.values, [])
        XCTAssertEqual(model.nonPrimitiveValues, [])
    }

    func testDecodingKeyNotPresentDefaultsToEmptyArray() throws {
        let jsonData = #"{}"#.data(using: .utf8)!
        let model = try JSONDecoder().decode(Model.self, from: jsonData)
        XCTAssertEqual(model.values, [])
        XCTAssertEqual(model.nonPrimitiveValues, [])
    }
    
    func testEncodingDecodedFailableArrayDefaultsToEmptyArray() throws {
        let jsonData = #"{ "values": null, "nonPrimitiveValues": null }"#.data(using: .utf8)!
        var _model = try JSONDecoder().decode(Model.self, from: jsonData)
        
        _model.values += [1, 2, 3]
        _model.nonPrimitiveValues += [Model.NestedModel(one: "a", two: ["b": ["c"]])]
        
        let modelData = try JSONEncoder().encode(_model)
        let model = try JSONDecoder().decode(Model.self, from: modelData)
        XCTAssertEqual(model.values, [1, 2, 3])
        XCTAssertEqual(model.nonPrimitiveValues, [Model.NestedModel(one: "a", two: ["b": ["c"]])])
    }
    
    func testEncodingDecodedFulfillableArrayRetainsContents() throws {
        let jsonData = #"{ "values": [1, 2], "nonPrimitiveValues": [{ "one": "one", "two": {"key": ["value"]}}] }"#.data(using: .utf8)!
        let _model = try JSONDecoder().decode(Model.self, from: jsonData)
        let modelData = try JSONEncoder().encode(_model)
        let model = try JSONDecoder().decode(Model.self, from: modelData)
        
        XCTAssertEqual(model.values, [1, 2])
        XCTAssertEqual(model.nonPrimitiveValues, [Model.NestedModel(one: "one", two: ["key": ["value"]])])
    }
}
