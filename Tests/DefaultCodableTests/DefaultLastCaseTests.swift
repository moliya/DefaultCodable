import XCTest
@testable import DefaultCodable

class DefaultLastCaseTests: XCTestCase {
    struct Model: Equatable, Codable {
        enum Language: String, Codable, CaseIterable {
            case swift, ruby, python, javascript, unknown
        }
        
        @Default.LastCase
        var language: Language
    }
    
    func testDecodingFailableEnumDefaultsToLastCase() throws {
        let jsonData = #"{ "language": null }"#.data(using: .utf8)!
        let model = try JSONDecoder().decode(Model.self, from: jsonData)
        XCTAssertEqual(model.language, .unknown)
    }
    
    func testDecodingKeyNotPresentDefaultsToLastCase() throws {
        let jsonData = #"{}"#.data(using: .utf8)!
        let model = try JSONDecoder().decode(Model.self, from: jsonData)
        XCTAssertEqual(model.language, .unknown)
    }
    
    func testEncodingDecodedFailableEnumDefaultsToLastCase() throws {
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
