import Foundation

public extension Default.Box {
    enum Zero<T: Codable & Numeric>: DefaultRawValue {
        public static var defaultValue: T { 0 }
    }
}

public extension Default {
    /// The default value is zero
    typealias Zero<T: Codable & Numeric> = Wrapper<Box.Zero<T>>
}
