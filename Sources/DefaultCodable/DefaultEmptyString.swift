import Foundation

public extension Default.Box {
    enum EmptyString: DefaultRawValue {
        public static var defaultValue: String { "" }
    }
}

public extension Default {
    /// The default value is an empty string
    typealias EmptyString = Wrapper<Box.EmptyString>
}
