import Foundation

public extension Default.Box {
    enum False: DefaultRawValue {
        public static var defaultValue: Bool { false }
    }
}

public extension Default {
    /// The default value is false
    typealias False = Wrapper<Box.False>
}
