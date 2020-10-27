import Foundation

public protocol DefaultRawValue {
    associatedtype Value: Codable
    static var defaultValue: Value { get }
}

public enum Default {
    @propertyWrapper
    public struct Wrapper<Raw: DefaultRawValue>: Codable {
        public var wrappedValue: Raw.Value
        
        public init() {
            wrappedValue = Raw.defaultValue
        }
        
        public init(wrappedValue: Raw.Value) {
            self.wrappedValue = wrappedValue
        }
        
        public init(from decoder: Decoder) throws {
            let container = try decoder.singleValueContainer()
            wrappedValue = (try? container.decode(Raw.Value.self)) ?? Raw.defaultValue
        }
        
        public func encode(to encoder: Encoder) throws {
            try wrappedValue.encode(to: encoder)
        }
    }
    
    public enum Box {}
}

extension Default.Wrapper: Equatable where Raw.Value: Equatable {}
extension Default.Wrapper: Hashable where Raw.Value: Hashable {}

public extension KeyedDecodingContainer {
    func decode<T>(_ type: Default.Wrapper<T>.Type, forKey key: Key) throws -> Default.Wrapper<T> {
        try decodeIfPresent(type, forKey: key) ?? .init()
    }
}
