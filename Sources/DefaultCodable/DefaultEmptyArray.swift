import Foundation

public extension Default.Box {
    enum EmptyArray<T: Codable & ExpressibleByArrayLiteral>: DefaultRawValue {
        public static var defaultValue: T { [] }
    }
}

public extension Default {
    /// The default value is an empty array
    typealias EmptyArray<T: Codable & ExpressibleByArrayLiteral> = Wrapper<Box.EmptyArray<T>>
}
