import Foundation

public extension Default.Box {
    enum FirstCase<T: Codable & CaseIterable>: DefaultRawValue {
        public static var defaultValue: T { T.allCases.first! }
    }
}

public extension Default {
    /// The default value is the first case
    typealias FirstCase<T: Codable & CaseIterable> = Wrapper<Box.FirstCase<T>>
}
