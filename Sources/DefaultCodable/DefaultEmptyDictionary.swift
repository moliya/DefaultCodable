import Foundation

public extension Default.Box {
    enum EmptyDictionary<T: Codable & ExpressibleByDictionaryLiteral>: DefaultRawValue {
        public static var defaultValue: T { [:] }
    }
}

public extension Default {
    /// The default value is an empty dictionary
    typealias EmptyDictionary<T: Codable & ExpressibleByDictionaryLiteral> = Wrapper<Box.EmptyDictionary<T>>
}
