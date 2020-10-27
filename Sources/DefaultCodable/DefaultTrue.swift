import Foundation

public extension Default.Box {
    enum True: DefaultRawValue {
        public static var defaultValue: Bool { true }
    }
}

public extension Default {
    /// The default value is true
    typealias True = Wrapper<Box.True>
}
