import Foundation

public extension Default.Box {
    enum One<T: Codable & Numeric>: DefaultRawValue {
        public static var defaultValue: T { 1 }
    }
}

public extension Default {
    /// The default value is one
    typealias One<T: Codable & Numeric> = Wrapper<Box.One<T>>
}
