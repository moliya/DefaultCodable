# DefaultCodable

#### Usage

```swift
struct Model: Codable {
    enum Category: String, Codable, CaseIterable {
        case unknown, oneCase, twoCase
    }
  
    @Default.EmptyString
    var title: String

    @Default.EmptyArray
    var comments: [Int]
  
    @Default.EmptyDictionary
    var actions: [String: Bool]
  
    @Default.True
    var flag: Bool
  
    @Default.Zero
    var count: Int
  
  	@Default.One
    var value: Double
  
    @Default.FirstCase
    var language: Category
}
```

