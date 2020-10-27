import XCTest
@testable import DefaultCodable

class DefaultZeroTests: XCTestCase {
    struct Model: Equatable, Codable {
        @Default.Zero
        var int: Int
        
        @Default.Zero
        var int8: Int8
        
        @Default.Zero
        var int16: Int16
        
        @Default.Zero
        var int64: Int64
        
        @Default.Zero
        var uint: UInt
        
        @Default.Zero
        var uint8: UInt8
        
        @Default.Zero
        var uint16: UInt16
        
        @Default.Zero
        var uint64: UInt64
        
        @Default.Zero
        var float: Float
        
        @Default.Zero
        var float32: Float32
        
        @Default.Zero
        var float64: Float64
        
        @Default.Zero
        var cgfloat: CGFloat
        
        @Default.Zero
        var double: Double
    }

    func testDecodingFailableNumberDefaultsToZero() throws {
        let jsonData = """
        {
            "int": null,
            "int8": null,
            "int16": null,
            "int64": null,
            "uint": null,
            "uint8": null,
            "uint16": null,
            "uint64": null,
            "float": null,
            "float32": null,
            "float64": null,
            "cgfloat": null,
            "double": null
        }
        """.data(using: .utf8)!
        let model = try JSONDecoder().decode(Model.self, from: jsonData)
        
        XCTAssertEqual(model.int, 0)
        XCTAssertEqual(model.int8, 0)
        XCTAssertEqual(model.int16, 0)
        XCTAssertEqual(model.int64, 0)
        XCTAssertEqual(model.uint, 0)
        XCTAssertEqual(model.uint8, 0)
        XCTAssertEqual(model.uint16, 0)
        XCTAssertEqual(model.uint64, 0)
        XCTAssertEqual(model.float, 0)
        XCTAssertEqual(model.float32, 0)
        XCTAssertEqual(model.float64, 0)
        XCTAssertEqual(model.cgfloat, 0)
        XCTAssertEqual(model.double, 0)
    }

    func testDecodingKeyNotPresentDefaultsToZero() throws {
        let jsonData = #"{}"#.data(using: .utf8)!
        let model = try JSONDecoder().decode(Model.self, from: jsonData)
        
        XCTAssertEqual(model.int, 0)
        XCTAssertEqual(model.int8, 0)
        XCTAssertEqual(model.int16, 0)
        XCTAssertEqual(model.int64, 0)
        XCTAssertEqual(model.uint, 0)
        XCTAssertEqual(model.uint8, 0)
        XCTAssertEqual(model.uint16, 0)
        XCTAssertEqual(model.uint64, 0)
        XCTAssertEqual(model.float, 0)
        XCTAssertEqual(model.float32, 0)
        XCTAssertEqual(model.float64, 0)
        XCTAssertEqual(model.cgfloat, 0)
        XCTAssertEqual(model.double, 0)
    }

    func testEncodingDecodedFailableNumberDefaultsToZero() throws {
        let jsonData = """
        {
            "int": null,
            "int8": null,
            "int16": null,
            "int64": null,
            "uint": null,
            "uint8": null,
            "uint16": null,
            "uint64": null,
            "float": null,
            "float32": null,
            "float64": null,
            "cgfloat": null,
            "double": null
        }
        """.data(using: .utf8)!
        var _model = try JSONDecoder().decode(Model.self, from: jsonData)

        _model.int = 1
        _model.int8 = 2
        _model.int16 = 3
        _model.int64 = 4
        _model.uint = 5
        _model.uint8 = 6
        _model.uint16 = 7
        _model.uint64 = 8
        _model.float = 9.9
        _model.float32 = 10.10
        _model.float64 = 11.11
        _model.cgfloat = 12.12
        _model.double = 13.13

        let modelData = try JSONEncoder().encode(_model)
        let model = try JSONDecoder().decode(Model.self, from: modelData)
        
        XCTAssertEqual(model.int, 1)
        XCTAssertEqual(model.int8, 2)
        XCTAssertEqual(model.int16, 3)
        XCTAssertEqual(model.int64, 4)
        XCTAssertEqual(model.uint, 5)
        XCTAssertEqual(model.uint8, 6)
        XCTAssertEqual(model.uint16, 7)
        XCTAssertEqual(model.uint64, 8)
        XCTAssertEqual(model.float, 9.9)
        XCTAssertEqual(model.float32, 10.10)
        XCTAssertEqual(model.float64, 11.11)
        XCTAssertEqual(model.cgfloat, 12.12)
        XCTAssertEqual(model.double, 13.13)
    }

    func testEncodingDecodedFulfillableNumberRetainsValue() throws {
        let jsonData = """
        {
            "int": 1,
            "int8": 2,
            "int16": 3,
            "int64": 4,
            "uint": 5,
            "uint8": 6,
            "uint16": 7,
            "uint64": 8,
            "float": 9.9,
            "float32": 10.10,
            "float64": 11.11,
            "cgfloat": 12.12,
            "double": 13.13
        }
        """.data(using: .utf8)!
        let _model = try JSONDecoder().decode(Model.self, from: jsonData)
        let modelData = try JSONEncoder().encode(_model)
        let model = try JSONDecoder().decode(Model.self, from: modelData)
        
        XCTAssertEqual(model.int, 1)
        XCTAssertEqual(model.int8, 2)
        XCTAssertEqual(model.int16, 3)
        XCTAssertEqual(model.int64, 4)
        XCTAssertEqual(model.uint, 5)
        XCTAssertEqual(model.uint8, 6)
        XCTAssertEqual(model.uint16, 7)
        XCTAssertEqual(model.uint64, 8)
        XCTAssertEqual(model.float, 9.9)
        XCTAssertEqual(model.float32, 10.10)
        XCTAssertEqual(model.float64, 11.11)
        XCTAssertEqual(model.cgfloat, 12.12)
        XCTAssertEqual(model.double, 13.13)
    }
}
