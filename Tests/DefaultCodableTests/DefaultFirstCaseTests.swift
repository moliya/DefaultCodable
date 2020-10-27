import XCTest
@testable import DefaultCodable

class DefaultFirstCaseTests: XCTestCase {
    struct Model: Equatable, Codable {
        enum Language: String, Codable, CaseIterable {
            case unknown, swift, ruby, python, javascript
        }
        
        @Default.FirstCase
        var language: Language
    }
    
    func testDecodingFailableEnumDefaultsToFirstCase() throws {
        let jsonData = #"{ "language": null }"#.data(using: .utf8)!
        let model = try JSONDecoder().decode(Model.self, from: jsonData)
        XCTAssertEqual(model.language, .unknown)
    }
    
    func testDecodingKeyNotPresentDefaultsToFirstCase() throws {
        let jsonData = #"{}"#.data(using: .utf8)!
        let model = try JSONDecoder().decode(Model.self, from: jsonData)
        XCTAssertEqual(model.language, .unknown)
    }
    
    func testEncodingDecodedFailableEnumDefaultsToFirstCase() throws {
        let jsonData = #"{ "language": null }"#.data(using: .utf8)!
        var _model = try JSONDecoder().decode(Model.self, from: jsonData)
        
        _model.language = .swift
        
        let modelData = try JSONEncoder().encode(_model)
        let model = try JSONDecoder().decode(Model.self, from: modelData)
        XCTAssertEqual(model.language, .swift)
    }
    
    func testEncodingDecodedFulfillableEnumRetainsValue() throws {
        let jsonData = #"{ "language": "swift" }"#.data(using: .utf8)!
        let _model = try JSONDecoder().decode(Model.self, from: jsonData)
        let modelData = try JSONEncoder().encode(_model)
        let model = try JSONDecoder().decode(Model.self, from: modelData)

        XCTAssertEqual(model.language, .swift)
    }
}
