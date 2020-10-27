import Foundation

public extension Default.Box {
    enum LastCase<T: Codable & CaseIterable>: DefaultRawValue {
        public static var defaultValue: T { T.allCases.reversed().first! }
    }
}

public extension Default {
    /// The default value is the last case
    typealias LastCase<T: Codable & CaseIterable> = Wrapper<Box.LastCase<T>>
}
